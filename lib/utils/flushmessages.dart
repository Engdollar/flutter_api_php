// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

flushSuccessMessage({required String messages, required BuildContext context}) {
  return FlutterToastr.show(messages, context,
      duration: FlutterToastr.lengthLong,
      position: FlutterToastr.center,
      backgroundColor: Colors.green);
}

flushErrorMEssages({required String messages, required BuildContext context}) {
  return FlutterToastr.show(messages, context,
      duration: FlutterToastr.lengthLong,
      position: FlutterToastr.center,
      backgroundColor: Colors.red);
}
