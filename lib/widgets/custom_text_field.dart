import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget
{
  final double spacing;
  final String label;
  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(8));
  final int maxLines;
  final String hintText;

  CustomTextField({required this.label, this.maxLines = 1, this.hintText = "", this.spacing = 16});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderRadius: borderRadius),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 14),
            ),
          ),
          SizedBox(height: spacing)],
      ),
    );
  }

}