import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/sizes.dart';

class CustomSpacingStyle {
  static EdgeInsetsGeometry paddingWithAppBarHeight = const EdgeInsets.only(
    top: CustomSize.appBarHeight,
    left: CustomSize.defaultSpace,
    bottom: CustomSize.defaultSpace,
    right: CustomSize.defaultSpace,
  );
}
