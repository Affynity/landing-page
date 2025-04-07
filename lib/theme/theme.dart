import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AffynityTheme {
  // Core Colors
  static const Color ivory = Color(0xFFFAF9F6);
  static const Color porcelain = Color(0xFFF3F2ED);
  static const Color obsidian = Color(0xFF1A1A1A);
  static const Color graphite = Color(0xFF444444);
  static const Color stone = Color(0xFFDADAD4);

  // Accent Colors
  static const Color blush = Color(0xFFEBDAD7);
  static const Color sage = Color(0xFFCBDDC9);
  static const Color gold = Color(0xFFE0D7BD);
  static const Color lilac = Color(0xFFE5E1F0);

  // Shadows
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: obsidian.withOpacity(0.04),
          offset: const Offset(0, 2),
          blurRadius: 12,
        ),
      ];

  static List<BoxShadow> get mediumShadow => [
        BoxShadow(
          color: obsidian.withOpacity(0.08),
          offset: const Offset(0, 4),
          blurRadius: 24,
        ),
      ];

  static ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      scaffoldBackgroundColor: ivory,
      colorScheme: ColorScheme.light(
        background: ivory,
        surface: porcelain,
        primary: blush,
        secondary: sage,
        tertiary: lilac,
        onBackground: obsidian,
        onSurface: graphite,
      ),
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme).copyWith(
        headlineLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: obsidian,
          height: 1.2,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: obsidian,
          height: 1.2,
          letterSpacing: -0.3,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: graphite,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: obsidian,
          letterSpacing: 0.2,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ivory,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: obsidian),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: obsidian,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: blush,
          foregroundColor: obsidian,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double>((states) {
            if (states.contains(MaterialState.pressed)) return 0;
            return 2;
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: graphite,
          side: BorderSide(color: stone, width: 2),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: stone, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: stone, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: blush, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF3B30), width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF3B30), width: 2),
        ),
        labelStyle: GoogleFonts.inter(
          color: graphite,
          fontSize: 16,
        ),
        hintStyle: GoogleFonts.inter(
          color: graphite.withOpacity(0.5),
          fontSize: 16,
        ),
        errorStyle: GoogleFonts.inter(
          color: const Color(0xFFFF3B30),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: porcelain,
        selectedColor: lilac,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          color: graphite,
        ),
        secondaryLabelStyle: GoogleFonts.inter(
          fontSize: 14,
          color: obsidian,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: blush,
        unselectedItemColor: graphite,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
        ),
      ),
    );
  }
}
