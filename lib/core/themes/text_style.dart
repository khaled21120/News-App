import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyStyle {
  static TextStyle regular11(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle semi9(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle regular10(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  static TextStyle regular12(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }

  static TextStyle primary12(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle bold12(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle title14(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }

  static TextStyle bold14(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle title16(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }

  static TextStyle title18(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle title23(BuildContext context) {
    return GoogleFonts.nunitoSans(
      fontSize: 23,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle title29(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 29,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}
