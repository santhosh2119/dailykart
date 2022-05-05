import 'package:flutter/material.dart';

import '../../base/dimension.dart';
import '../../base/font_style.dart';

class CoustomDrawer extends StatelessWidget {
  final String title;
  final Icon icon;
  const CoustomDrawer({required this.title, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: poppinsBold
            .copyWith(fontSize: Dimensions.fontSizeLarge)
            .copyWith(color: Colors.white),
      ),
      leading: icon,
      iconColor: Colors.white,
      onTap: () {
        print("Clicked");
      },
    );
  }
}
