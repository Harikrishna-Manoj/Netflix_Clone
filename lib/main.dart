import 'package:flutter/material.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';
import 'core/colors/colors.dart';

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
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: backgroundColor),
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white))),
      home: ScreenMainPage(),
    );
  }
}
