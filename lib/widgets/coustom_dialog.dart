import 'package:flutter/material.dart';

class CoustomDialog extends StatelessWidget {
  final BuildContext cxt;
  final String header;
  final String message;
  const CoustomDialog({required this.cxt,required this.header, required this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showDialog(
      context: cxt,
      builder: (ctx) => AlertDialog(
        title: Text(header),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
          )
        ],
      ),
    ) as Widget;
  }
}
