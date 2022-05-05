import 'package:flutter/material.dart';

class CoustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator validator;
  final String labelText;
  final bool obscureText;
  const CoustomInputField(
      {required this.controller,
      required this.keyboardType,
      required this.textInputAction,
      required this.validator,
      required this.labelText,
      this.obscureText = false,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
