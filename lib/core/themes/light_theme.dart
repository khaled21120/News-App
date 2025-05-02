import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyColors {
  static const Color primary = Color(0xffBEDE61);
  static const Color white = Color(0xffFFFFFF);
  static const Color scaffold = Color(0xff13140D);
  static const Color black = Color(0xff000000);
  static const Color darkGrey = Color(0xff30312D);
  static const Color lightGrey = Color(0xffBBC4CE);
  static const Color grey = Color(0xff858585);
  static const Color accent = Color(0xffFEC158);
  static const Color cardBG = Color(0xff363636);
}

ThemeData lightThemeData = ThemeData(
  colorScheme: const ColorScheme(
    primary: MyColors.primary,
    secondary: MyColors.accent,
    onSecondary: MyColors.grey,
    surface: MyColors.white,
    error: Colors.redAccent,
    onPrimary: MyColors.white,
    onSurface: MyColors.white,
    onError: MyColors.white,
    onTertiaryContainer: MyColors.white,
    brightness: Brightness.light,
  ),
  cardTheme: CardTheme(
    color: MyColors.cardBG,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  dialogTheme: const DialogTheme(backgroundColor: MyColors.primary),
  scaffoldBackgroundColor: MyColors.scaffold,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: MyColors.primary,
      foregroundColor: MyColors.white,
      textStyle: GoogleFonts.poppins(
        fontSize: 18,
        color: MyColors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
);
