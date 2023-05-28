import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

const kWidth = SizedBox(width: 10);
const kHeight = SizedBox(height: 10);
const kHeight20 = SizedBox(height: 20);
const kHeight50 = SizedBox(height: 50);

//TextStyle
TextStyle kHomePageTitleStyle =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

//ThemeData
ThemeData appThemeData = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: backgroundColor),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white)));
