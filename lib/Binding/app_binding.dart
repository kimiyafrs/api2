import 'package:get/get.dart';

import '../view_model.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(UserViewModel());
  }

}