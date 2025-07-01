import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';

class FacilityBox extends StatelessWidget {
  FacilityBox({
    Key? key,
    required this.info,
    required this.icon,
    this.bgColor = Colors.white,
    this.color = darker,
  }) : super(key: key);
  final String icon;
  final String info;
  final Color bgColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 80,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: .5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, color: darker, width: 20, height: 20),
          SizedBox(height: 8),
          Text(
            info,
            maxLines: 1,
            style: TextStyle(fontSize: 13, color: labelColor),
          ),
        ],
      ),
    );
  }
}
