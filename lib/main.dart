import 'package:flutter/material.dart';
import 'package:flutter_api_crud/screens/users.dart';
import 'package:flutter_api_crud/screens/users/add.dart';
import 'package:flutter_api_crud/utils/sidebar.dart';

// import 'utils/sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(context),
      appBar: AppBar(
        title: Text("API Crud App"),
      ),
      body: Center(child: Text("This is Home Page")),
    );
  }
}
