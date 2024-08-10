import 'package:api2/Binding/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api2/view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      title: 'User List',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  //final UserViewModel userViewModel = Get.put(UserViewModel());
  var userViewModel = Get.find<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: Obx(() {
          if (userViewModel.users.isEmpty) {
            userViewModel.fetchUsers();
            return Container();
          }

          return ListView.builder(
            itemCount: userViewModel.users.length,
            itemBuilder: (context, index) {
              final user = userViewModel.users[index];

              return ListTile(
                title: Text(user.username ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.email ?? ''),
                    Text(user.phone ?? ''),
                  ],
                ),
                onTap: () {

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('User Details'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Username: ${user.username ?? ''}'),
                            Text('Email: ${user.email ?? ''}'),
                            Text('Phone: ${user.phone ?? ''}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.grey),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },

                            child: Text('OK'),

                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}