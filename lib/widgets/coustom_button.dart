import 'package:daily_kart/base/dimension.dart';
import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CoustomButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(
          Dimensions.paddingSizeLarge,
        ),
        child: Text(text),
      ),
    );
  }
}
