import 'package:flutter/material.dart';

// ignore: unused_element
class SearchTitleWidget extends StatelessWidget {
  const SearchTitleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
    );
  }
}
