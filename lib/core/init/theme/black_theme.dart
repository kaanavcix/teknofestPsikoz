import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../utility/embabed/embabed_utility.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.black
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: grTertiary,
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: EmbabedUtility.errorColor, width: 1),
            borderRadius: BorderRadius.circular(15)),

        //enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(15)),
        fillColor: EmbabedUtility.socialGray),
    textTheme: textTheme,
    scaffoldBackgroundColor: EmbabedUtility.darkBlack,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: EmbabedUtility.primaryColor,
        onPrimary: EmbabedUtility.primaryColor,
        secondary: EmbabedUtility.socialPink,
        onSecondary: EmbabedUtility.socialPink,
        error: EmbabedUtility.errorColor,
        onError: EmbabedUtility.errorColor,
        background: EmbabedUtility.darkBlack,
        onBackground: EmbabedUtility.darkBlack,
        surface: EmbabedUtility.darkBlack,
        onSurface: EmbabedUtility.darkBlack));

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: grTertiary,
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: EmbabedUtility.errorColor, width: 1),
            borderRadius: BorderRadius.circular(15)),

        //enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(15)),
        fillColor: EmbabedUtility.socialGray),
    textTheme: textTheme,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: EmbabedUtility.socialwhite,
        onPrimary: EmbabedUtility.socialwhite,
        secondary: EmbabedUtility.socialPink,
        onSecondary: EmbabedUtility.socialPink,
        error: EmbabedUtility.errorColor,
        onError: EmbabedUtility.errorColor,
        background: EmbabedUtility.darkBlack,
        onBackground: EmbabedUtility.darkBlack,
        surface: EmbabedUtility.socialGray,
        onSurface: EmbabedUtility.socialGray
  
));
