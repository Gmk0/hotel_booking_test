import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF5F5F5),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: Colors.black87, size: 20),
        ),
      ),
    );
  }
}