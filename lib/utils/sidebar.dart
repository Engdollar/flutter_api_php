// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_api_crud/main.dart';
import 'package:flutter_api_crud/screens/users.dart';
// import 'dart:js';

Drawer Sidebar(context) {
  return Drawer(
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UserAccountsDrawerHeader(
            accountName: Text("Your Full name"),
            accountEmail: Text("your email here@gmail.com")),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          height: 60.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => MyHomePage())));
            },
            child: Text("Home"),
          ),
        ),
        Container(
          width: double.infinity,
          height: 60.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => UsersPAge())));
            },
            child: Text("Users"),
          ),
        ),
      ],
    ),
  );
}
