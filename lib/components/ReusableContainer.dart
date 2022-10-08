import 'package:flutter/material.dart';

const ReusableContainerColor = Color(0XFF1D1E33);

class ReusableContainer extends StatelessWidget {
  ReusableContainer(
      {this.colour = ReusableContainerColor, this.cardChild, this.onPressed});
  final Color colour;
  final cardChild;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
