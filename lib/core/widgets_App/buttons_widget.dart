import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ButtonCustom(
    double? elevated,
    double? width,
    double? height,
    Widget? widget,
    TextStyle? textStyle,
    Color? textColor,
    Color? backgroundColor,
    Color? borderSideColor,
    Function()? function) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      textStyle: textStyle,
      fixedSize: Size(width!, height!),
      elevation: elevated,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: widget,
  );
}
