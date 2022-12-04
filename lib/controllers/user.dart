import 'dart:async';
import 'dart:convert';
import 'package:flutter_api_crud/models/user.dart';
import 'package:http/http.dart' as http;
import '../contstans/constants.dart';

class UsersController {
// Constants
  static const IP_ADDRESS = "192.168.1.107";
  static const VIEW_URL = "http://" + IP_ADDRESS + "/api-crud/Users/select.php";
  static const ADD_URL = "http://" + IP_ADDRESS + "/api-crud/Users/add.php";
  static const DELETE_URL =
      "http://" + IP_ADDRESS + "/api-crud/Users/delete.php";
  static const UPDATE_URL =
      "http://" + IP_ADDRESS + "/api-crud/Users/update.php";
  // static const UPDATE_URL = "http://192.168.1.107/api-crud/Users/update.php";
// get data
  List<UserModel> userFromJson(String jsonstring) {
    final data = json.decode(jsonstring);
    return List<UserModel>.from(data.map((item) => UserModel.fromjson(item)));
  }

  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<UserModel> list = userFromJson(response.body);
      return list;
    } else {
      return <UserModel>[];
    }
  }

// add data
  Future<String> addUSer(UserModel userModel) async {
    final respnose =
        await http.post(Uri.parse(ADD_URL), body: userModel.tojsonAdd());
    if (respnose.statusCode == 200) {
      print("Add Response : " + respnose.body);
      return respnose.body;
    } else {
      return "Error";
    }
  }

// update data
  Future<String> UpdateUser(UserModel userModel) async {
    final respnose =
        await http.post(Uri.parse(UPDATE_URL), body: userModel.tojsonUpdate());
    if (respnose.statusCode == 200) {
      print("Update Response : " + respnose.body);
      return respnose.body;
    } else {
      return "Error";
    }
  }

// delete data
  Future<String> DeleteUser(UserModel userModel) async {
    final respnose =
        await http.post(Uri.parse(DELETE_URL), body: userModel.tojsonUpdate());
    if (respnose.statusCode == 200) {
      print("Delete Response : " + respnose.body);
      return respnose.body;
    } else {
      return "Error";
    }
  }
}
