import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_api_crud/utils/sidebar.dart';
import 'package:http/http.dart' as http;

import '../../contstans/constants.dart';

class ViewUser extends StatelessWidget {
  ViewUser({required this.Myuser});
  Map Myuser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(context),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.newshub.co.nz/dam/form-uploaded-images/SaudiArabia_Fallout_1120_GETTY.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Icon(Icons.dashboard_outlined),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Full Name: " + Myuser["Full_Name"],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email: " + Myuser["Emaill"],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Username: " + Myuser["Username"],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Password: " + Myuser["Password"],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
