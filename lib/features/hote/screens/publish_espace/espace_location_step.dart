import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/app_export.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';
import 'package:hotel_booking/widgets/map_widget.dart';

class EspaceLocationStep extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Où se trouve l'espace ?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(label: "Commune"),
            CustomTextField(label: "Quartier"),
            CustomTextField(label: "Rue"),
            SizedBox(height: 200, child: MapWidget(),),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: (){},
                child: const Text(
                  "Enregistrer",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}