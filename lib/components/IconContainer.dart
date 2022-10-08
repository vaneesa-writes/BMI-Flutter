import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.iconData, required this.iconText});

  final IconData iconData;
  String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          iconText,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
