import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/app_export.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/capacite_widget.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';

class InformationStep extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Informations principal",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            CustomTextField(label: "Nom de l'espace",),
            CustomTextField(label: "Description détaillée", maxLines: 3,),
            CustomTextField(label: "Capacité maximale (nombre de personne",),
            CustomTextField(label: "Superficie (m2)"),
            CustomTextField(label: "Etage / immeuble (facultatif)"),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: EspaceCapaciteWidget(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Padding(padding: EdgeInsets.all(2), child: const Text(
                    'Enregistrer le brouillon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),),
                )),
                SizedBox(width: 10,),
                Expanded(child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: const Text(
                    'Enregistrer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

}