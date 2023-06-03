import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 28,
        ),
        kWidth,
        SizedBox(
          width: 28,
          height: 26,
          child: Image.asset(
            "assets/Netflix-avatar.png",
            fit: BoxFit.cover,
          ),
        ),
        kWidth,
      ],
    );
  }
}
