import 'package:flutter/material.dart';
import 'package:psikoz/product/init/theme/text_theme.dart';

import '../../../core/utility/embabed/embabed_utility.dart';
import 'light_text_theme.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black87),
    appBarTheme: const AppBarTheme(
        elevation: 0, centerTitle: false, backgroundColor: Colors.white),
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
    ),
    textTheme: textThemew,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: EmbabedUtility.socialwhite,
        onPrimary: EmbabedUtility.socialwhite,
        secondary: EmbabedUtility.socialblue,
        onSecondary: EmbabedUtility.socialPink,
        error: EmbabedUtility.errorColor,
        onError: EmbabedUtility.errorColor,
        background: EmbabedUtility.darkBlack,
        onBackground: EmbabedUtility.darkBlack,
        surface: EmbabedUtility.socialGray,
        onSurface: EmbabedUtility.socialGray));
