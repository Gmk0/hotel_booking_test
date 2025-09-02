import 'package:flutter/material.dart';
import 'package:hotel_booking/core/app_export.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';

class CategorySelectionStep extends StatefulWidget
{
  const CategorySelectionStep({Key? key}) : super(key: key);

  @override
  State<CategorySelectionStep> createState() => _CategorySelectionStepState();
}

class _CategorySelectionStepState extends State<CategorySelectionStep>
{
  int? selectedIndex;

  final List<Map<String, dynamic>> categories = [
    {"title": "Salle de fête", "image": CustomImageAssets.hotel1, "icon": Icons.celebration},
    {"title": "Salle de réunion", "image": CustomImageAssets.hotel2, "icon": Icons.groups},
    {"title": "Salle de mariage", "image": CustomImageAssets.hotel3, "icon": Icons.ring_volume},
    {"title": "Espaces verts", "image": CustomImageAssets.hotel4, "icon": Icons.eco},
    {"title": "Salle polyvalente", "image": CustomImageAssets.hotel5, "icon": Icons.event},
    {"title": "Salle de sport", "image": CustomImageAssets.hotel6, "icon": Icons.fitness_center},
    {"title": "Terrain de jeu", "image": CustomImageAssets.hotel7, "icon": Icons.sports_soccer},
    {"title": "Coworking", "image": CustomImageAssets.hotel8, "icon": Icons.computer},
    {"title": "Bureau", "image": CustomImageAssets.hotel4, "icon": Icons.business_center},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Quelle catégorie d’espace ?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Expanded(child: GridView.builder(
              itemCount: categories.length + 1, // +1 for "add new"
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.85,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                if (index == categories.length) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, size: 40, color: Colors.white),
                      ),
                    ),
                  );
                }

                final category = categories[index];
                final bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedScale(
                    scale: isSelected ? 1.05 : 1.0, // bounce effect
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutBack,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isSelected ? 1.0 : 0.9,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Stack(
                            children: [
                              Image.asset(
                                category["image"],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(category["icon"], size: 22, color: Colors.black87),
                                      const SizedBox(height: 4),
                                      Text(
                                        category["title"],
                                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
      /*bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: selectedIndex != null ? () {} : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.accentGreen,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("Continuer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),*/
    );
  }
}
