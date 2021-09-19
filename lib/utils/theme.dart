import 'package:aklny/utils/vars.dart';
import 'package:flutter/material.dart';

class AklnyTheme {
  final ThemeData lightTheme = ThemeData(
    fontFamily: GetLAng?.lang == 'en_US' ?? true ? 'SF UI Display' : 'Tajawal',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    backgroundColor: Color(0xFFFFFFFF),
    primaryColor: Color(0xFFFC6011),
    shadowColor: Color(0xFF4A4B4D),
    buttonColor: Color(0xFF4267B2),
    indicatorColor: Color(0xFFFFFFFF),
    highlightColor: Color(0xFFFC6011).withOpacity(0.20),
    hintColor: Color(0xFFDE4D3B),
    cardColor: Color(0xFFF2F2F2),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xFF4A4B4D),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      headline2: TextStyle(
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      headline3: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0xFFFC6011).withOpacity(0.65),
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      headline5: TextStyle(
        color: Color(0xFF4A4B4D).withOpacity(0.5),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      headline6: TextStyle(
        color: Color(0xFFB6B7B7),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      bodyText1: TextStyle(
        color: Color(0xFFDE4D3B),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF4267B2),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  final ThemeData darkTheme = ThemeData(
    fontFamily: GetLAng?.lang == 'en_US' ?? true ? 'SF UI Display' : 'Tajawal',
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF000000),
    textTheme: TextTheme(),
  );
}
