// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget TextFieldCustom(
  Color? textFiedColor,
  Widget suffixIcon,
  String hintText,
  TextEditingController controller,
  TextInputType keyboardType,
  int maxLines,
) {
  return TextFormField(
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
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hintText: hintText,
      suffixIcon: suffixIcon,
    ),
    controller: controller,
    keyboardType: keyboardType,
    maxLines: maxLines,
  );
}
