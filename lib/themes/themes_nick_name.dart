import 'package:flutter/material.dart';
import 'package:scaffold_flutter/themes/colors_nick_name.dart';

class ThemesNickName {
  ThemesNickName._();

  static const TextTheme textTheme = TextTheme(
    headline5: TextStyle(
        color: ColorsNickName.kNickNameRed50,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: ColorsNickName.kNickNameRed50,
        fontSize: 18,
        fontWeight: FontWeight.bold),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorsNickName.kNickNameRed50),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorsNickName.kNickNameRed50),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: ColorsNickName.kNickNameRed50),
    ),
  );
}
