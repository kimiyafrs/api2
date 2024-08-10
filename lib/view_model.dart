import 'package:api2/screen1/screen1.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserViewModel extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  var users = <UserModel>[].obs;

  Future<void> fetchUsers() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));

    if(response.statusCode==200){
      List<dynamic> jsonList=json.decode(response.body);
      users.value = jsonList.map((json)=>
      UserModel.fromJson(json)).toList();
    }else{
      throw Exception('failed');
    }
  }
}



