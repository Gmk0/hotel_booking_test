import 'package:flutter/material.dart';
import 'package:hotel_booking/features/profile/widgets/MenuDivider.dart';
import 'package:hotel_booking/features/profile/widgets/MenuSection.dart';

import '../widgets/MenuItem.dart';
import '../widgets/TopTitle.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              child: TopTitle(title: "Paramètres du\ncompte"),
            ),

            const SizedBox(height: 22),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                children: [
                  const SizedBox(height: 8),

                  // Section 1
                  MenuSection(
                    items: [
                      MenuItem(icon: Icons.person_outline, title: "Informations personnelles",onClick: (){

                      },),
                      MenuItem(icon: Icons.shield_outlined, title: "Connexion et sécurité",onClick: (){

                      },),
                      MenuItem(icon: Icons.pan_tool_alt_outlined, title: "Confidentialité",onClick: (){

                      },),
                      MenuItem(icon: Icons.notifications_none, title: "Notifications",onClick: (){

                      },),
                      MenuItem(icon: Icons.account_balance_wallet_outlined, title: "Paiements",onClick: (){

                      },),
                      MenuItem(icon: Icons.language_outlined, title: "Traduction",onClick: (){

                      },),
                      MenuItem(icon: Icons.work_outline, title: "Voyage d'affaires",onClick: (){

                      },),
                      MenuItem(icon: Icons.settings_accessibility_outlined, title: "Accessibilité",onClick: (){

                      },),

                    ],
                  ),

                  const SizedBox(height: 12),

                  // Divider
                  MenuSectionDivider(),

                  const SizedBox(height: 8),

                  //section 2 (business / taxes)
                  MenuSection(
                    items: [
                      MenuItem(icon: Icons.cases_outlined, title: "Informations sur l'entreprise",onClick: (){

                      },),
                      MenuItem(icon: Icons.calculate_outlined, title: "Taxes",onClick: (){

                      },),
                      MenuItem(icon: Icons.person_pin_outlined, title: "Votre premier voyageur",onClick: (){

                      },),

                    ],
                  ),

                  const SizedBox(height: 36),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



