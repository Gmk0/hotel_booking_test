import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class MapWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      child: Center(
        child: Text("Map widget..."),
      ),
    );
  }

}