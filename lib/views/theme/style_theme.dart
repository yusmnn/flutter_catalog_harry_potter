import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_theme.dart';

class StyleTheme {
  static ThemeData styleTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: ColorsTheme.white,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorsTheme.white,
        secondary: ColorsTheme.darkBlue,
      ),
      appBarTheme: AppBarTheme(
        color: ColorsTheme.darkBlue,
        titleTextStyle: GoogleFonts.cinzel(
          color: ColorsTheme.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(
          color: ColorsTheme.white,
        ),
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(
            color: ColorsTheme.white.withOpacity(0.05),
          ),
        ),
      ),
      scaffoldBackgroundColor: ColorsTheme.darkBlue,
      cardColor: ColorsTheme.blue,
      dialogTheme: DialogTheme(
        backgroundColor: ColorsTheme.darkBlue,
        titleTextStyle: GoogleFonts.inter(
          color: ColorsTheme.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
        contentTextStyle: GoogleFonts.inter(
          color: ColorsTheme.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        titleLarge: const TextStyle(
          fontSize: 24,
          color: ColorsTheme.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        titleMedium: const TextStyle(
          fontSize: 18,
          color: ColorsTheme.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorsTheme.white,
        ),
        bodyMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ColorsTheme.white,
        ),
        labelMedium: const TextStyle(
          color: ColorsTheme.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
