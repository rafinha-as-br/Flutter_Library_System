// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

/// Global application theme for the Library Manager App
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF4A6FA5), // soft blue
        onPrimary: Colors.white,
        secondary: Color(0xFF6B9080), // green-gray tone
        onSecondary: Colors.white,
        error: Color(0xFFD62828),
        onError: Colors.white,
        background: Color(0xFFF5F5F5),
        onBackground: Color(0xFF1B1B1B),
        surface: Colors.white,
        onSurface: Color(0xFF1B1B1B),
      ),

      scaffoldBackgroundColor: const Color(0xFFF5F5F5),

      // Text theme with large, readable font sizes
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        displaySmall: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyLarge: TextStyle(fontSize: 18, height: 1.4),
        bodyMedium: TextStyle(fontSize: 16, height: 1.4),
        bodySmall: TextStyle(fontSize: 14, height: 1.3),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),

      // AppBar style
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF4A6FA5),
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A6FA5),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Cards — use CardThemeData here (fixes the "can't assign CardTheme" error)
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 3,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Input fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF4A6FA5), width: 2),
        ),
        labelStyle: const TextStyle(fontSize: 16, color: Color(0xFF555555)),
      ),

      // Floating action buttons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF6B9080),
        foregroundColor: Colors.white,
        elevation: 3,
      ),
    );
  }
}
