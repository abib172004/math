import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralise la configuration du thème de l'application.
class AppTheme {
  static const _seedColor = Colors.indigo;

  /// Thème pour le mode clair.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.latoTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.grey.shade50,
      foregroundColor: _seedColor,
      elevation: 1,
    ),
    cardTheme: CardTheme(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
    ),
  );

  /// Thème pour le mode sombre.
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.latoTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 1,
    ),
    cardTheme: CardTheme(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
