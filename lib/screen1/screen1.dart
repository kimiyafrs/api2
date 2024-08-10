import 'package:flutter/material.dart';

class UserModel{
 String? _userName;
 String? _email;
 String? _phone;

 UserModel({String? username, String? email,String? phone}){
  _userName = username;
  _email = email;
  _phone = phone;
 }
 String? get username => _userName;
 set username(String? value) => _userName = value;
 String? get email => _email;
 set email(String? value) => _email = value;
  String? get phone => _phone;
  set phone(String? value) => _phone = value;
 factory UserModel.fromJson(Map<String,dynamic>json){
  return UserModel(
  username: json['username'],
  email: json['email'],
   phone: json['phone'],
  );
 }
}