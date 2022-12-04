import 'package:flutter/material.dart';

TextFormField InputFeilds(
    {required String hintedText,
    required String LabelText,
    // required Function validator(),
    required final MyController,
    bool? isPass}) {
  return TextFormField(
    obscureText: isPass == true ? isPass = true : isPass = false,
    controller: MyController,
    validator: (value) {
      if (value!.isEmpty) {
        return "This $LabelText is Required";
      }
    },
    decoration: InputDecoration(
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      fillColor: Colors.grey.shade200,
      focusColor: Colors.grey.shade200,
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      filled: true,
      labelStyle: TextStyle(color: Colors.black54),
      hintText: hintedText,
      labelText: LabelText,
      border: OutlineInputBorder(borderSide: BorderSide.none),
    ),
  );
}
