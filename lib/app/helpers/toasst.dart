import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toast(msg) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.grey[300]!.withOpacity(0.8),
    textColor: Colors.grey[800],
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
  );
}
