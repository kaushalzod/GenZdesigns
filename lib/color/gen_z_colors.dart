import 'package:flutter/material.dart';

class GenZColors {
  static Color primary = const Color(0xff3880FF);
  static Color secondary = const Color(0xffAA66CC);
  static Color tertiary = const Color(0xffAA66CC);
  static Color dark = const Color.fromARGB(255, 48, 0, 72);
  static Color complimentry = Colors.green;
  static Color success = const Color(0xff10DC60);
  static Color warning = const Color(0xffFFBB33);
  static Color error = const Color(0xffF04141);
  static const Color white = Color(0xffffffff);
  static const Color transparent = Colors.transparent;
  static updateColor(
      {Color? primaryColor,
      Color? secondaryColor,
      Color? tertiaryColor,
      Color? darkColor,
      Color? complimentryColor,
      Color? successColor,
      Color? warningColor,
      Color? errorColor}) {
    primary = primaryColor ?? primary;
    secondary = secondaryColor ?? secondary;
    tertiary = tertiaryColor ?? tertiary;
    dark = darkColor ?? dark;
    complimentry = complimentryColor ?? complimentry;
    success = successColor ?? success;
    warning = warningColor ?? warning;
    error = errorColor ?? error;
  }
}
