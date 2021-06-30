import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  // Dark Theme Colors
  static const _darkBackground = Color(0xFF35323A);
  static const darkerBackground = Color(0xFF25222A);
  static const darkerPrimary = Color(0xFFC9A53A);
  static const _darkPrimary = Color(0xFFD9B54A);
  static const _darkAccent = Color(0xFF929A9E);
// Light Theme Colors

  static final ThemeData lightTheme = ThemeData.light();
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      canvasColor: Colors.white,
      primaryColor: _darkPrimary,
      accentColor: _darkAccent,
      backgroundColor: _darkBackground,
      cardColor: darkerBackground,
      errorColor: Colors.red,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: darkerBackground),
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          elevation: 10,
          backgroundColor: darkerBackground,
          titleTextStyle: TextStyle(
              fontFamily: "BebasNeue",
              fontSize: 28,
              letterSpacing: 2,
              color: _darkPrimary)),
      textTheme: TextTheme(
          headline3: TextStyle(
              color: _darkPrimary,
              fontFamily: "Satisfy",
              fontWeight: FontWeight.bold),
          headline4: TextStyle(
              fontFamily: "BebasNeue",
              fontSize: 18,
              letterSpacing: 2.5,
              color: _darkPrimary,
              fontWeight: FontWeight.bold)));
}
