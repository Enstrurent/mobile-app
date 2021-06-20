import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Dark Theme Colors
const darkBackground = Color(0xFF35323A);
const darkerBackground = Color(0xFF25222A);
const darkPrimary = Color(0xFFD9B54A);
const darkAccent = Color(0xFF929A9E);
// Light Theme Colors

class Themes {
  static final ThemeData lightTheme = ThemeData.light();
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    canvasColor: Colors.white,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    backgroundColor: darkBackground,
    errorColor: Colors.red,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: darkerBackground),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      elevation: 10,
      backgroundColor: darkerBackground,
      titleTextStyle: TextStyle(
        fontFamily: "BebasNeue",
        fontSize: 28,
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