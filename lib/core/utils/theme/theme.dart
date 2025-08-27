import 'package:hotel_booking/core/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:hotel_booking/core/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:hotel_booking/core/utils/theme/custom_themes/chip_theme.dart';
import 'package:hotel_booking/core/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:hotel_booking/core/utils/theme/custom_themes/outline_buttom_theme.dart';
import 'package:hotel_booking/core/utils/theme/custom_themes/text_themes.dart';

import 'package:flutter/material.dart';

import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/text_field_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextThemeCustom.lightTextTheme,
      chipTheme: CustomChipTheme.lightChipTheme,
      appBarTheme: AppBarThemeC.lightAppBarTheme,
      checkboxTheme: CheckboxThemeC.lightCheckBoxTheme,
      bottomSheetTheme: BottomSheetThemeC.lightBottomSheetTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: OutlineButtomThemeC.lightOutlinedButtonTheme,
      inputDecorationTheme: TextFieldThemeC.lightInputDecorationTheme);
  static ThemeData dartTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextThemeCustom.darkTextTheme,
      chipTheme: CustomChipTheme.darktChipTheme,
      appBarTheme: AppBarThemeC.darkAppBarTheme,
      checkboxTheme: CheckboxThemeC.darkCheckBoxTheme,
      bottomSheetTheme: BottomSheetThemeC.darkBottomSheetTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: OutlineButtomThemeC.darkOutlinedButtonTheme,
      inputDecorationTheme: TextFieldThemeC.darkInputDecorationTheme);

  static var textPrimary;
}

class AppColors {
  static const Color kPrimary = Color(0xFF6759FF);
  static const Color kBackground = Color(0xFFF9F9F9);
  static const Color kHint = Color(0xFFD1D3D4);
  static const Color kAccent4 = Color(0xFFB5EBCD);
  static const Color kInput = Color(0xFFF5F5F5);
  static const Color kNeutral01 = Color(0xFFFCFCFC);
  static const Color kNeutral03 = Color(0xFFEFEFEF);
}
