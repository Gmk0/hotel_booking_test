import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/app_export.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';

class PublishServiceScreen extends StatefulWidget {
  @override
  _PublishServiceScreenState createState() => _PublishServiceScreenState();
}

class _PublishServiceScreenState extends State<PublishServiceScreen> {
  int activeStep = 0;
  int upperBound = 4; // total steps

  // Form data
  String? selectedCategory;

  // Images
  final List<File> _images = [];
  final picker = ImagePicker();

  /**
   * Selection image.
   */
  Future<void> _pickImage() async
  {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null)
    {
      setState(() => _images.add(File(picked.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Publier un service",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          DotStepper(
            activeStep: activeStep,
            dotCount: upperBound + 1,
            shape: Shape.pipe,
            spacing: 10,
            onDotTapped: (index) => setState(() => activeStep = index),
            tappingEnabled: false,
          ),
          SizedBox(height: 20),
          Expanded(child: _getStepContent(activeStep)),
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
                  child: Text(activeStep == upperBound ? "Publier maintenan" : "Suivant",
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

  /// Step
  Widget _getStepContent(int step) {
    switch (step) {
      case 0:
        return _buildCategoriesStep();
      case 1:
        return _empty();
      case 2:
        return _empty();
      case 3:
        return _empty();
      case 4:
        return _buildPhotosStep();
      default:
        return Container();
    }
  }

  /// STEP 1: Categories
  Widget _buildCategoriesStep()
  {
    final categories = [
      {"icon": Icons.draw, "label": "Art et design"},
      {"icon": Icons.fitness_center, "label": "Fitness et bien-etre"},
      {"icon": Icons.restaurant, "label": "Cuisine et boissons"},
      {"icon": Icons.history_edu_sharp, "label": "Histoire et culture"},
      {"icon": Icons.account_tree, "label": "Nature et plein air"},
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Quelle expérience allez-vous proposer aux voyageurs?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = categories[index];
                final isSelected = selectedCategory == item["label"];
                return GestureDetector(
                  onTap: () => setState(() => selectedCategory = item["label"].toString()),
                  child: Card(
                    color: isSelected ? Colors.green[50] : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? AppTheme.accentGreen : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item["icon"] as IconData,
                            size: 50, color: isSelected ? AppTheme.accentGreen : Colors.grey),
                        SizedBox(height: 10),
                        Text(item["label"].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? AppTheme.accentGreen : Colors.black)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// STEP 5: Photos upload
  Widget _buildPhotosStep() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ajouter quelques photos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: _images.length + 1, // +1 pour le button d'ajout
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                if (index == _images.length) {
                  return GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                    ),
                  );
                } else {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          _images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () => setState(() => _images.removeAt(index)),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.black54,
                            child: Icon(Icons.close, color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _empty()
  {
    return Center(
      child: Text("Contenu du step..."),
    );
  }

}
