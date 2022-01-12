import 'package:flutter/material.dart';

class LembretesThemes {
  static final darkTheme = ThemeData(
    primaryColorDark: const Color(0xff424242),
    scaffoldBackgroundColor: const Color(0xff121212),//Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.white,
    ),
    cardColor: const Color(0xff424242),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: Color(0xff2c281d),
        titleTextStyle: TextStyle(color: Colors.white)),
  );

  static final lightTheme = ThemeData(
    primaryColor: const Color(0xffFFDB84),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff544646),
      secondary: Color(0xffFFDB84),
    ),
    cardColor: const Color(0xffFFDB84),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
        )),
  );
}
