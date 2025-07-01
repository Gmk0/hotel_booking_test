import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';


class CustomChipTheme {
  CustomChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: CustomColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: CustomColors.hotelColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
  static ChipThemeData darktChipTheme = const ChipThemeData(
    disabledColor: CustomColors.darkerGrey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: CustomColors.hotelColor,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
