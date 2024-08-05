// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import '../resources/color.dart';

// ignore: non_constant_identifier_names
Widget TextFieldCustom(
    Color? textFiedColor,
    Widget suffixIcon,
    Widget prefixIcon,
    String hintText,
    TextEditingController controller,
    TextInputType keyboardType,
    int maxLines,
    Function(String)? onSubmit,
    Function()? ontap,
    bool obscureText
    ) {
  return TextFormField(
    obscureText: obscureText,

    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'filed ${hintText} should be not empty !';
      }
      return null;
    },
    onSaved: (value) {
      controller.text = value!;
    },
    onTap:ontap,
    onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
      filled: true,
        fillColor: textFiedColor,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:  BorderSide(color: subtitleColor,width: 0.6)
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:  BorderSide(color: subtitleColor,width: 0.6)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:  BorderSide(color: subtitleColor,width: 0.6)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:  BorderSide(color: subtitleColor,width: 0.6)
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: subtitleColor,fontSize: 14),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon
    ),
    controller: controller,
    keyboardType: keyboardType,
    maxLines: maxLines,
  );
}
