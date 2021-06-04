import 'package:flutter/material.dart';

// Dark Theme Colors
const darkBackground = Color(0xFF35323A);
const darkPrimary = Color(0xFFD9B54A);
const darkAccent = Color(0xFF929A9E);
const darkError = Color(0xFFBA1B1D);
// Light Theme Colors

class Themes {
  static final ThemeData lightTheme = ThemeData.light();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    backgroundColor: darkBackground,
    errorColor: darkError,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      elevation: 10,
      backgroundColor: darkBackground,
      titleTextStyle: TextStyle(
        fontFamily: "Satisfy",
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: darkPrimary
      )
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
        color: darkPrimary,
        fontFamily: "Satisfy",
        fontWeight: FontWeight.bold
      )
    )
  );

}