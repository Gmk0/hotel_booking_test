import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback? onTap;
  double width;
  double height;

  HeaderIcon({
    required this.icon,
    required this.label,
    required this.onTap,
    this.width = 100,
    this.height = 150
  });

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color.fromARGB(255, 0, 26, 17);
    const gold = Color(0xFFD4A63D);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: gold, size: 40),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}