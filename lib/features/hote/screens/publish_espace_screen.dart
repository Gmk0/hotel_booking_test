import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/commodites_step.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/disponibilite_step.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/espace_categories.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/espace_conditions_step.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/espace_location_step.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/facturation_mode.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/images_step.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace/information_step.dart';
import 'package:im_stepper/stepper.dart';

class PublishEspaceScreen extends StatefulWidget
{
  @override
  _PublishEspaceScreenState createState() => _PublishEspaceScreenState();
}

class _PublishEspaceScreenState extends State<PublishEspaceScreen>
{
  int activeStep = 0;
  int upperBound = 7; // total steps

  // Form data
  String? selectedCategory;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publier un espace",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          /**
           * Caché parceque ça fait pas du tout beau à voir.
           */
          Visibility(
              child: DotStepper(
            activeStep: activeStep,
            dotCount: upperBound + 1,
            shape: Shape.pipe,
            spacing: 10,
            onDotTapped: (index) => setState(() => activeStep = index),
            tappingEnabled: false,
          ),
              visible: false,
          ),
          /**
           * Contenu du step.
           */
          Expanded(child: _getStepContent(activeStep)),
          /***
           * Boutton retour & continuer
           */
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: activeStep > 0 ? () => setState(() => activeStep--) : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                  ),
                  child: Text("Retour",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (activeStep < upperBound)
                    {
                      setState(() => activeStep++);
                    }
                    else
                    {
                      /**
                       * Dernière etape:
                       * executer une requete de publication du service vers l'api backend.
                       */
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                  ),
                  child: Text(activeStep == upperBound ? "Publier maintenan" : "Continuer",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Steps
  Widget _getStepContent(int step)
  {
    switch (step)
    {
      case 0: /** categorie step */
        return CategorySelectionStep();
      case 1: /** info step */
        return InformationStep();
      case 2: /** images upload step. */
        return ImagesStep();
      case 3: /** Facturation mode step */
        return FacturationModeStep();
      case 4: /** commodites step */
        return CommoditesStep();
      case 5 : /** adresse step */
        return EspaceLocationStep();
      case 6 : /** horaire step */
        return EspaceDisponibiliteStep();
      case 7 : /** conditions step */
        return EspaceConditionsStep();
      default:
        return Container();
    }
  }

}
