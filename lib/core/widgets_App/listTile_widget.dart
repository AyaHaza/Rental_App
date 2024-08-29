import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ListTileCustom(
    bool isThreeLine,
    Widget? title,
    TextStyle? titelTextStyle,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    TextStyle? subTitleTextStyle,
    TextStyle? leadingAndTrailingTextStyle) {
  return ListTile(
    isThreeLine: isThreeLine,
    title: title,
    titleTextStyle: titelTextStyle,
    subtitle: subtitle,
    subtitleTextStyle: subTitleTextStyle,
    leading: leading,
    trailing: trailing,
    leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
  );
}
