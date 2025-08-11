import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title;

  const TopTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // circle back button
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: const Center(
              child: Icon(Icons.arrow_back, color: Colors.black87, size: 20),
            ),
          ),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 34,
              height: 1.03,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}