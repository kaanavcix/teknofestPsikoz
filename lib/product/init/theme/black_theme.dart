import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikoz/product/init/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../core/utility/embabed/embabed_utility.dart';

ThemeData darkTheme = ThemeData(
  checkboxTheme: CheckboxThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))),
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme:  AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: false,
      backgroundColor: Color(0xff131313),
      titleTextStyle: grBodyB.copyWith(color: Colors.white)
    ),
   // primaryTextTheme: TextTheme.,
  
    inputDecorationTheme: InputDecorationTheme(

      labelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,fontWeight: FontWeight.normal,
          color: EmbabedUtility.socialLightGray
        ),
        
        filled: true,
        hintStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,fontWeight: FontWeight.normal,
          color: EmbabedUtility.socialLightGray
        ),
        
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(9)),
        errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: EmbabedUtility.errorColor, width: 1),
            borderRadius: BorderRadius.circular(9)),

        //enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(9)),
        fillColor: EmbabedUtility.socialGray),
    textTheme: GoogleFonts.interTextTheme(Typography.whiteHelsinki),
    //GoogleFonts.plusJakartaSansTextTheme(Typography.whiteHelsinki),
    scaffoldBackgroundColor: Color(0xff131313),
    colorScheme: const ColorScheme(
      
        brightness: Brightness.dark,
        primary: EmbabedUtility.socialwhite,
        onPrimary: EmbabedUtility.primaryColor,
        secondary: EmbabedUtility.socialPink,
        onSecondary: EmbabedUtility.socialPink,
        error: EmbabedUtility.errorColor,
        onError: EmbabedUtility.errorColor,
        background: EmbabedUtility.socialLightGray,
        onBackground: EmbabedUtility.socialLightGray,
        surface: EmbabedUtility.socialGray,
        onSurface: EmbabedUtility.socialGray));

