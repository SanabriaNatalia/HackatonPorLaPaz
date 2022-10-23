import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon,
      bool isPassword = false}) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 199, 186)),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 0, 199, 186)),
      ),
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      hintText: hintText,
      suffixIcon: isPassword ? const Icon(Icons.visibility_off_rounded) : null,
    );
  }
}
