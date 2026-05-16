import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: AppColors.darkBackground,

  primaryColor: AppColors.darkPrimary,

  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimary,
    secondary: AppColors.secondary,
    surface: AppColors.darkSurface,
    error: AppColors.error,

    onPrimary: AppColors.onDarkPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: AppColors.onDarkSurface,
    onError: AppColors.onError,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    foregroundColor: AppColors.onDarkBackground,
    elevation: 0,
    centerTitle: true,
  ),

  cardColor: AppColors.darkSurface,

  dividerColor: AppColors.mediumGray2,

  iconTheme: const IconThemeData(color: AppColors.primaryYellow),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.onDarkBackground),

    bodyMedium: TextStyle(color: AppColors.grey4),

    titleLarge: TextStyle(
      color: AppColors.onDarkBackground,
      fontWeight: FontWeight.bold,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkSurface,

    hintStyle: const TextStyle(color: AppColors.textGrey),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

      borderSide: const BorderSide(color: AppColors.mediumGray2),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

      borderSide: const BorderSide(color: AppColors.mediumGray2),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

      borderSide: const BorderSide(color: AppColors.primaryYellow, width: 2),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.onDarkPrimary,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);
