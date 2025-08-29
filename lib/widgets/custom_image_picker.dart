import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget
{
  String sectionLabel;
  bool mutipleUploads;

  CustomImagePicker({this.sectionLabel = "", this.mutipleUploads = false});

  @override
  State<StatefulWidget> createState() {
    return CustomImagePickerState(sectionLabel: sectionLabel, multipleUploads: mutipleUploads);
  }
}

class CustomImagePickerState extends State<CustomImagePicker>
{
  // Images
  final List<File> _images = [];
  final picker = ImagePicker();

  String sectionLabel;
  bool multipleUploads;

  CustomImagePickerState({this.sectionLabel = "", this.multipleUploads = false});

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
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sectionLabel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: (multipleUploads)? _images.length + 1 : 1, // +1 pour le button d'ajout si multiple uploads.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                if (index == _images.length)
                {
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
                }
                else
                {
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

}