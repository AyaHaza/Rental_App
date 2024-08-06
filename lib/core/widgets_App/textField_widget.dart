// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget TextFieldCustom(
  void Function()? function,
  Color textFiedColor,
  Color borderColor,
  Widget preffixIcon,
  Widget? suffixIcon,
  String hintText,
  TextEditingController controller,
  TextInputType keyboardType,
  int maxLines,
) {
  return TextFormField(
    onTap: function,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'filed ${hintText} should be not empty !';
      }
      return null;
    },
    onSaved: (value) {
      controller.text = value!;
    },
    decoration: InputDecoration(
      filled: true,
      fillColor: textFiedColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      hintText: hintText,
      prefixIcon: preffixIcon,
      suffixIcon: suffixIcon,
    ),
    controller: controller,
    keyboardType: keyboardType,
    maxLines: maxLines,
  );
}
