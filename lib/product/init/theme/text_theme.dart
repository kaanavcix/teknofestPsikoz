import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:google_fonts/google_fonts.dart";

TextStyle grText = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white );
TextStyle grBody = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color:  Colors.white );
TextStyle grSText = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white);
TextStyle grTertiary = GoogleFonts.spaceGrotesk(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: Colors.white);

TextStyle grTextB = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle grBodyB = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle grSTextB = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle grTertiaryB = GoogleFonts.spaceGrotesk(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.white);

TextStyle grTextSB = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: Colors.white);
TextStyle grBodySB = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: Colors.white);
TextStyle grSTextSB = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    color: Colors.white);
TextStyle grTertiarySB = GoogleFonts.spaceGrotesk(
    fontSize: 10,
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

