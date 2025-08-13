import 'package:flutter/material.dart';

class Screen extends StatelessWidget
{

  Widget body;
  double paddingTop = 0;
  double paddingBottom = 0;
  double paddingLeft = 0;
  double paddingRight = 0;

  Screen({required this.body, this.paddingTop = 0, this.paddingBottom = 0, this.paddingLeft = 0, this.paddingRight = 0});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
        padding: EdgeInsets.only(bottom: 50),
        child: body,
    );
  }

}