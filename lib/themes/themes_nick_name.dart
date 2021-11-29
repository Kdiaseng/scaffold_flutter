import 'package:flutter/material.dart';
import 'package:scaffold_flutter/themes/colors_nick_name.dart';

class ThemesNickName {
  ThemesNickName._();

  static const TextTheme textTheme = TextTheme(
    headline5: TextStyle(
        color: Colors.black45, fontSize: 20, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Colors.black45, fontSize: 18, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(
        color: Colors.black45, fontSize: 16, fontWeight: FontWeight.bold),
    subtitle2: TextStyle(
        color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold),
    button: TextStyle(
        letterSpacing: 1.25,
        color: Colors.black45,
        fontSize: 14,
        fontWeight: FontWeight.bold),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.black45),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.deepPurple),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.deepPurple),
    ),
  );
}
