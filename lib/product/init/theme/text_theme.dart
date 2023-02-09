import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:google_fonts/google_fonts.dart";

TextStyle grText = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.white );
TextStyle grBody = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color:  Colors.white );
TextStyle grSText = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white);
TextStyle grTertiary = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white);

TextStyle grTextB = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle grBodyB = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle grSTextB = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle grTertiaryB = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white);

TextStyle grTextSB = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Colors.white);
TextStyle grBodySB = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: Colors.white);
TextStyle grSTextSB = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: Colors.white);
TextStyle grTertiarySB = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    color: Colors.white);

TextTheme textTheme = const TextTheme().copyWith(
  
  bodySmall: grTertiarySB,
  bodyMedium: grBodyB,
  bodyLarge: grSTextB,
  labelSmall: grSTextB,
  displaySmall: grTextSB,
  displayMedium: grBodySB,
  displayLarge: grSTextSB,
  labelMedium: grTextB,
  headlineLarge: grSText,
  headlineMedium: grBody,
  headlineSmall: grText,
  titleSmall: grTertiary,
  titleMedium: grTertiaryB
  
);

