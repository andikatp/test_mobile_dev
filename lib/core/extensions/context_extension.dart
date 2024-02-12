import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
}
