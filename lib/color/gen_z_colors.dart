import 'package:flutter/material.dart';

class GenZColors {
  /// Primary Color
  static Color primary = const Color(0xff3880FF);

  /// Secondary Color
  static Color secondary = const Color(0xffAA66CC);

  /// Tertiary Color
  static Color tertiary = const Color(0xffAA66CC);

  /// Dark Color
  static Color dark = const Color.fromARGB(255, 48, 0, 72);

  /// Complimentry Color
  static Color complimentry = Colors.green;

  /// Success Color
  static Color success = const Color(0xff10DC60);

  /// Warning Color
  static Color warning = const Color(0xffFFBB33);

  /// Error Color
  static Color error = const Color(0xffF04141);

  /// White Color
  static const Color white = Color(0xffffffff);

  /// Transparent Color
  static const Color transparent = Colors.transparent;

  /// Function to update or provide custom color code
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
