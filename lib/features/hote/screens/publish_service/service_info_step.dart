import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/custom_select_field.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';

class ServiceInfoStep extends StatelessWidget {
  const ServiceInfoStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informations principales',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              // Nom du service
              CustomTextField(label: "Nom du service"),
              // Description détaillée
              CustomTextField(label: "Description détaillée", maxLines: 3),

              // Type de service
              CustomSelectField(label: "Type de service"),

              // Durée moyenne
              CustomTextField(label: "Durée moyenne", hintText: "ex. 30 min, 2 h, 1 jour",),

              // Button
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
                    'Continuer',
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
      ),
    );
  }
}
