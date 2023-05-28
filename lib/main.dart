import 'package:flutter/material.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';
import 'core/constants/constants.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NetFlix",
      theme: appThemeData,
      home: ScreenMainPage(),
    );
  }
}
