import 'package:flutter/material.dart';

class CoustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CoustomTextButton(
      {required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
