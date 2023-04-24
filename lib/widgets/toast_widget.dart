import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.TOP,
      textColor: textColor,
      backgroundColor: backgroundColor,
      fontSize: 16.sp);
}
