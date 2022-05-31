import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { success, failure }

Future<bool?> showToast(String text, ToastState toastState) async {
  return await Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor:
        toastState == ToastState.failure ? Colors.red : Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
