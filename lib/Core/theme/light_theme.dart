import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: AppColors.background,

  primaryColor: AppColors.primary,

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    error: AppColors.error,

    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: AppColors.onSurface,
    onError: AppColors.onError,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.onBackground,
    elevation: 0,
    centerTitle: true,
  ),

  cardColor: AppColors.surface,

  dividerColor: AppColors.grey4,

  iconTheme: const IconThemeData(color: AppColors.primary),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.onBackground),

    bodyMedium: TextStyle(color: AppColors.mediumGray2),

    titleLarge: TextStyle(
      color: AppColors.onBackground,
      fontWeight: FontWeight.bold,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surface,

    hintStyle: const TextStyle(color: AppColors.textGrey),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

      borderSide: const BorderSide(color: AppColors.grey4),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

      borderSide: const BorderSide(color: AppColors.grey4),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);
