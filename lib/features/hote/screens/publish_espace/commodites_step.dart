import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';

class CommoditesStep extends StatefulWidget
{
  const CommoditesStep({super.key});

  @override
  State<CommoditesStep> createState() => _CommoditesStepState();
}

class _CommoditesStepState extends State<CommoditesStep>
{
  final List<Map<String, dynamic>> avantages = [
    {"icon": CustomImageAssets.hotel1, "label": "Chaises, tables", "selected": true},
    {"icon": CustomImageAssets.hotel2, "label": "Climatisation /\nventilation", "selected": true},
    {"icon": CustomImageAssets.hotel3, "label": "Projecteur /\nécran", "selected": true},
    {"icon": CustomImageAssets.hotel4, "label": "Parking", "selected": true},
    {"icon": CustomImageAssets.hotel4, "label": "Cuisine /\ntraiteur", "selected": true},
    {"icon": CustomImageAssets.hotel5, "label": "Wifi", "selected": true},
    {"icon": CustomImageAssets.hotel6, "label": "Parking", "selected": true},
    {"icon": CustomImageAssets.hotel7, "label": "Sécurité", "selected": true},
    {"icon": CustomImageAssets.hotel1, "label": "Serrure\nsécurisée", "selected": true},
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Commodités",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Sélectionnez ce que l’espace propose :",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Grid des avantages
            Expanded(child: GridView.builder(
              itemCount: avantages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemBuilder: (context, index) {
                final avantage = avantages[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      avantage["selected"] = !avantage["selected"];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                avantage["icon"],
                                height: 40,
                                width: 40,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                avantage["label"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (avantage["selected"])
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black87,
                              ),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
