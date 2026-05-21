import 'package:flutter/material.dart';

class AppTheme {
  // Pure, high-contrast palette
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF666666);

  // Premium tech accent (Crisp Emerald Green)
  static const Color accent = Color(0xFF00B074);
  static const Color border = Color(0xFFE5E5E5);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: background,
      primaryColor: accent,
      fontFamily: 'Icon', // Defaults to clean system fonts automatically
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          letterSpacing: -0.5,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: -0.2,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: textSecondary,
        ),
      ),
    );
  }
}
