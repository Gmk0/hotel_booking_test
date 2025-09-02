import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';

class EspaceConditionsStep extends StatefulWidget
{
  const EspaceConditionsStep({Key? key}) : super(key: key);

  @override
  State<EspaceConditionsStep> createState() => _EspaceConditionsStepState();
}

class _EspaceConditionsStepState extends State<EspaceConditionsStep> with SingleTickerProviderStateMixin
{
  String selectedPolicy = "Modérée";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre
            Text(
              "Conditions & Règlement",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),

            Text(
              "Politique d’annulation",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                _buildPolicyButton("Flexible"),
                const SizedBox(width: 10),
                _buildPolicyButton("Modérée"),
                const SizedBox(width: 10),
                _buildPolicyButton("Stricte"),
              ],
            ),

            const SizedBox(height: 25),

            // Règlement intérieur
            CustomTextField(label: "Règlement intérieur"),

            // Conditions spéciales
            CustomTextField(label: "Conditions spéciales",maxLines: 4,),

          ],
        ),
      ),
    );
  }

  Widget _buildPolicyButton(String text)
  {
    final bool isSelected = selectedPolicy == text;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPolicy = text;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
