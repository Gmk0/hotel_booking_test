import 'package:flutter/material.dart';
import 'package:hotel_booking/features/profile/widgets/MenuSection.dart';

import '../widgets/MenuItem.dart';
import '../widgets/TopTitle.dart';

class ObtenirAideScreen extends StatelessWidget {
  const ObtenirAideScreen({super.key});

  static const _bg = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TopTitle(title: "Obtenir de l'aide"),
            ),

            const SizedBox(height: 22),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                children: [
                  const SizedBox(height: 8),

                  // Section menu
                  MenuSection(
                    items: [
                      MenuItem(icon: Icons.question_mark, title: "Consulter le Centre d'aide",onClick: (){

                      },),
                      MenuItem(icon: Icons.security_sharp, title: "Assistance et Sécurité",onClick: (){

                      },),
                      MenuItem(icon: Icons.flag_outlined, title: "Signaler un problème",onClick: (){

                      },),
                      MenuItem(icon: Icons.report_gmailerrorred_sharp, title: "Envoyer mes remarques",onClick: (){

                      },),


                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



