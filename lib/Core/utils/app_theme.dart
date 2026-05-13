import 'package:ecommerce_project/Core/theme/dark_theme.dart';
import 'package:ecommerce_project/Core/theme/light_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get getlightTheme => lightTheme;
  static ThemeData get getdarkTheme => darkTheme;
}
