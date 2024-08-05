import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ButtonCustom(
    double? elevated,
    double? width,
    double? height,
    Widget? widget,
    Color? backgroundColor,
    Color sideColor,
    
    //Color? borderSideColor,
    Function()? function) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      side: BorderSide(color: sideColor),
      fixedSize: Size(width!, height!),
      elevation: elevated,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: borderSideColor!,width: 0.6 )
      ),
    ),
    child: widget,
  );
}
