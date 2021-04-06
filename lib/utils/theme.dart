import 'package:aklny/utils/vars.dart';
import 'package:flutter/material.dart';

class AklnyTheme {
  final ThemeData lightTheme = ThemeData(
    fontFamily: GetLAng?.lang == 'en_US' ?? true ? 'SF UI Display' : 'Almarai',
    brightness: Brightness.light,
    backgroundColor: Color(0xFFFFFFFF),
    primaryColor: Color(0xFFFFC529),
    shadowColor: Color(0xFF4A4B4D),
    buttonColor: Color(0xFFFC6011).withOpacity(0.20),
    textTheme: TextTheme(
        headline1: TextStyle(
      color: Color(0xFF4A4B4D),
      // fontFamily: 'SF UI Display',
      fontWeight: FontWeight.w500,
      fontSize: 18,
    )),
  );
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF000000),
    textTheme: TextTheme(),
  );
}
