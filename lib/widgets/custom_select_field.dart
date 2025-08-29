import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelectField extends StatelessWidget
{
  final double spacing;
  final String label;
  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(8));

  /**
   * options.
   */
  List<Map<String, dynamic>> options = [];

  CustomSelectField({required this.label, this.spacing = 16});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: borderRadius),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 16),
            ),
            hint: const Text('Sélectionner'),
            items: const [
              DropdownMenuItem(value: 'Option1', child: Text('Option 1')),
              DropdownMenuItem(value: 'Option2', child: Text('Option 2')),
            ],
            onChanged: (value) {},
          ),
          SizedBox(height: spacing),
        ],
      ),
    );
  }

}