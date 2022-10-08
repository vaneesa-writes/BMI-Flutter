import 'package:flutter/material.dart';

import '../allConstants.dart';

class Value_and_Units extends StatelessWidget {
  Value_and_Units({required this.value, required this.unit});
  final double value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          value.toInt().toString(),
          style: kNumberStyle,
        ),
        Text(
          unit,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
