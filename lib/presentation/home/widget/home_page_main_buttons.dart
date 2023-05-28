import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CoustomTextButton extends StatelessWidget {
  const CoustomTextButton(
      {super.key,
      required this.icon,
      required this.label,
      this.iconSize = 30,
      this.textSize = 15,
      this.textColor = Colors.white});
  final IconData icon;
  final String label;
  final double iconSize;
  final double textSize;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: textSize,
              color: textColor),
        )
      ],
    );
  }
}
