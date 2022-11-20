import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:google_fonts/google_fonts.dart";

TextStyle grText = GoogleFonts.spaceGrotesk(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grBody = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grSText = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grTertiary = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Get.isDarkMode ? Colors.white : Colors.black);

TextStyle grTextB = GoogleFonts.spaceGrotesk(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grBodyB = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grSTextB = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grTertiaryB = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black);

TextStyle grTextSB = GoogleFonts.spaceGrotesk(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grBodySB = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grSTextSB = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: Get.isDarkMode ? Colors.white : Colors.black);
TextStyle grTertiarySB = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    color: Get.isDarkMode ? Colors.white : Colors.black);

TextTheme textTheme = TextTheme().copyWith(
  
  bodySmall: grTextB,
  bodyMedium: grBodyB,
  bodyLarge: grSTextB,
  labelSmall: grSTextB,
  displaySmall: grTextSB,
  displayMedium: grBodySB,
  displayLarge: grSTextSB,
  labelMedium: grTertiarySB,
  headlineLarge: grSText,
  headlineMedium: grBody,
  headlineSmall: grText,
  titleSmall: grTertiary,
  
);
