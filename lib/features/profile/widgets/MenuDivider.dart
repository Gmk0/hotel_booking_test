import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuSectionDivider extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Divider(height: 1, thickness: 1, color: Color(0xFFECECEC)),
    );
  }
}