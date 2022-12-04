import 'package:flutter/foundation.dart';

class UserModel {
  final FullName;
  final Email;
  final Username;
  final Password;
  final No;
  UserModel({this.FullName, this.Email, this.Username, this.Password, this.No});

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      FullName: json['Full_Name'],
      Email: json['Email'],
      Username: json['Username'],
      Password: json['Password'],
      No: json['No'],
    );
  }

  Map<String, dynamic> tojsonAdd() {
    return {
      "FullName": FullName,
      "Username": Username,
      "Password": Password,
      "Email": Email,
    };
  }

  Map<String, dynamic> tojsonUpdate() {
    return {
      "No": No,
      "FullName": FullName,
      "Username": Username,
      "Password": Password,
      "Email": Email,
    };
  }
}
