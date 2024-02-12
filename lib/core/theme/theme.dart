import 'package:flutter/material.dart';
import 'package:test_mobile_dev/core/theme/color.dart';

class AppTheme {
  AppTheme._();
  static final currentTheme = ThemeData(
    colorSchemeSeed: Colours.primaryColor,
    scaffoldBackgroundColor: Colours.backgroundColor,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
