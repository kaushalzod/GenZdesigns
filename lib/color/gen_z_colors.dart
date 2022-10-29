import 'package:flutter/material.dart';

class GenZColors {
  /// Primary Color
  static Color primary = const Color(0xffF7B22C);

  /// Secondary Color
  static Color secondary = const Color(0xffD7C3A5);

  /// Tertiary Color
  static Color tertiary = const Color(0xff3C312B);

  /// Dark Color
  static Color dark = const Color(0xff3d3c3c);

  /// Complimentry Color
  static Color complimentry = const Color(0XFF403E2D);

  /// Success Color
  static Color success = const Color(0xff009c71);

  /// Warning Color
  static Color warning = const Color(0xffFFBB33);

  /// Error Color
  static Color error = const Color(0xffe0474c);

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
