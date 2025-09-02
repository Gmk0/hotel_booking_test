import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hotel_booking/core/app_export.dart';

import '../../../../core/utils/constants/image_strings.dart';

class VerificationStep extends StatelessWidget
{
  const VerificationStep({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white, // ignore dark mode
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile card
              /*Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "Gloire KANDA",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),*/

              // List of options
              Expanded(
                child: ListView(
                  children: [
                    _buildListTile(
                      image:
                      CustomImageAssets.hotel1, // replace with real asset
                      title: "À propos de vous",
                      subtitle: "Vos qualifications",
                    ),
                    _buildListTile(
                      image:
                      CustomImageAssets.hotel2, // replace with real asset
                      title: "Lieu",
                      subtitle:
                      "Gombe-Matadi, Kinshasa, Kinshasa, Democratic Republic Of The Congo",
                    ),
                    _buildListTile(
                      image: CustomImageAssets.hotel3,
                      title: "Photos",
                      subtitle: "5 photos",
                    ),
                    _buildListTile(
                      image: CustomImageAssets.hotel4,
                      title: "Service",
                      subtitle: "titre",
                    ),
                    _buildListTile(
                      image: CustomImageAssets.hotel5,
                      title: "Offres",
                      subtitle: "Mariage religieux",
                    ),
                    _buildListTile(
                      image: CustomImageAssets.hotel6,
                      title: "Détails",
                      subtitle: "Aucune",
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentGreen,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          "Envoyer pour vérification",
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "En sélectionnant Envoyer pour vérification, vous acceptez les Conditions relatives aux services. Consultez la Politique de confidentialité.",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget _buildListTile({required String image, required String title, required String subtitle,})
  {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        backgroundImage: AssetImage(image),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
