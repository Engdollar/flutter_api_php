import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_api_crud/controllers/user.dart';
import 'package:flutter_api_crud/contstans/constants.dart';
import 'package:flutter_api_crud/main.dart';
import 'package:flutter_api_crud/models/user.dart';
import 'package:flutter_api_crud/screens/users/add.dart';
import 'package:flutter_api_crud/screens/users/view.dart';
import 'package:flutter_api_crud/utils/sidebar.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:http/http.dart' as http;

import '../utils/flushmessages.dart';

class UsersPAge extends StatefulWidget {
  const UsersPAge({Key? key}) : super(key: key);

  @override
  State<UsersPAge> createState() => _UsersPAgeState();
}

class _UsersPAgeState extends State<UsersPAge> {
  List<UserModel> userslist = [];

  StreamController _streamController = StreamController();
  Future getAllUsers() async {
    userslist = await UsersController().getUsers();
    _streamController.sink.add(userslist);
  }

  deleteUser(UserModel userModel) async {
    await UsersController().DeleteUser(userModel).then((success) {
      // print("success full added ");
      flushSuccessMessage(
          messages: "User Deleted SuccessFully", context: context);
    }).onError((error, stackTrace) {
      flushErrorMEssages(
          messages: "Whoops, (: User is not Deleted", context: context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // _streamController
    Timer.periodic(Duration(seconds: 1), (timer) {
      getAllUsers();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragEnd: (DragEndDetails details) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => AddUser())));
            },
            child: Icon(
              Icons.person_add,
              color: Color.fromARGB(255, 58, 57, 67),
            )),
        drawer: Sidebar(context),
        appBar: AppBar(title: Text("Users Page")),
        body: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return ListView.builder(
                  itemCount: userslist.length,
                  itemBuilder: ((context, index) {
                    UserModel MyUser = userslist[index];

                    return Card(
                      elevation: 4.0,
                      child: Container(
                        color: Color.fromARGB(255, 42, 161, 120),
                        // margin: EdgeInsets.symmetric(vertical: 3),
                        padding: EdgeInsets.zero,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AddUser(
                                          userModel: MyUser,
                                          index: index,
                                        ))));
                          },
                          textColor: Color.fromARGB(255, 242, 244, 244),
                          leading: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 168, 248, 175),
                              foregroundColor: Color.fromARGB(255, 1, 41, 4),
                              child: Text(MyUser.FullName[0])),
                          title: Text(MyUser.FullName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email: " + MyUser.Email),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete_sweep_rounded,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              deleteUser(MyUser);
                            },
                          ),
                        ),
                      ),
                    );
                  }));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
