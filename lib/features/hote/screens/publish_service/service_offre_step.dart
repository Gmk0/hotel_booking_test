import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/custom_image_picker.dart';
import 'package:hotel_booking/widgets/custom_select_field.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';

class ServiceOffreStep extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tarification & Offre',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            // Nom de l'offre
            CustomTextField(label: "Nom de l'offre"),
            // Prix
            CustomTextField(label: "Prix (USD/CDF)",),
            //Durée
            CustomSelectField(label: "Durée"),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: const Text(
                  'Ajouter une offre',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}