import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.scaffold,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      primary: AppColors.primary,
      onPrimary: Colors.white,

      secondary: AppColors.primaryDark,
      onSecondary: Colors.white,

      surface: AppColors.card,
      onSurface: AppColors.textPrimary,

      error: Colors.red,
      onError: Colors.white,

      outline: AppColors.surface,


    ),

    cardTheme: CardThemeData(
      color: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

}