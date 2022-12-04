import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_api_crud/controllers/user.dart';
import 'package:flutter_api_crud/models/user.dart';
import 'package:flutter_api_crud/screens/users.dart';
import 'package:flutter_api_crud/utils/flushmessages.dart';
import 'package:flutter_api_crud/utils/sidebar.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/text_input_Field.dart';
import '../../contstans/constants.dart';

class AddUser extends StatefulWidget {
  final UserModel? userModel;
  final index;
  AddUser({this.userModel, this.index});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool isEditMode = false;
  final _formkey = GlobalKey<FormState>();

  TextEditingController FullName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController No = TextEditingController();

  add(UserModel userModel) async {
    await UsersController().addUSer(userModel).then((success) {
      flushSuccessMessage(messages: "User added Successfuly", context: context);

      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => UsersPAge())));
      // print("success full added ");
    }).onError((error, stackTrace) {
      flushErrorMEssages(
          messages: "Whoops, (: User is not Created", context: context);

      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => UsersPAge())));
    });
  }

  update(UserModel userModel) async {
    await UsersController().UpdateUser(userModel).then((success) {
      flushSuccessMessage(
          messages: "User Updated Successfuly", context: context);

      FlutterToastr.show("User Updated Successfuly", context,
          duration: FlutterToastr.lengthLong,
          position: FlutterToastr.center,
          backgroundColor: Colors.green);
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => UsersPAge())));
      // print("success full added ");
    }).onError((error, stackTrace) {
      flushErrorMEssages(
          messages: "Whoops, (: User is not Updated", context: context);

      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => UsersPAge())));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.index != null) {
      isEditMode = true;
      FullName.text = widget.userModel?.FullName;
      Email.text = widget.userModel?.Email;
      Username.text = widget.userModel?.Username;
      Password.text = widget.userModel?.Password;
      No.text = widget.userModel?.No;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragEnd: (DragEndDetails details) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: Sidebar(context),
        appBar: AppBar(
            title: Text(isEditMode ? "Edit User Page" : "Add User Page")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Spacer(),
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2.0,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            InputFeilds(
                              hintedText: "Eng Micaad",
                              LabelText: "Full Name",
                              MyController: FullName,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InputFeilds(
                              hintedText: "example.@mail.com",
                              LabelText: "Email",
                              MyController: Email,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InputFeilds(
                              hintedText: "eng.micaad",
                              LabelText: "Username",
                              MyController: Username,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InputFeilds(
                              isPass: true,
                              hintedText: "************",
                              LabelText: "Password",
                              MyController: Password,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (isEditMode) {
                                    if (_formkey.currentState!.validate()) {
                                      _formkey.currentState!.save();
                                      UserModel userModel = UserModel(
                                        No: No.text,
                                        FullName: FullName.text,
                                        Email: Email.text,
                                        Username: Username.text,
                                        Password: Password.text,
                                      );
                                      update(userModel);
                                      FullName.clear();
                                      Email.clear();
                                      Username.clear();
                                      Password.clear();
                                    }
                                  } else {
                                    if (_formkey.currentState!.validate()) {
                                      _formkey.currentState!.save();
                                      UserModel userModel = UserModel(
                                        FullName: FullName.text,
                                        Email: Email.text,
                                        Username: Username.text,
                                        Password: Password.text,
                                      );
                                      add(userModel);
                                      FullName.clear();
                                      Email.clear();
                                      Username.clear();
                                      Password.clear();
                                    }
                                  }
                                },
                                child: Text(isEditMode ? " Update " : " Save "))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
