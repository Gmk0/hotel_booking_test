import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/custom_image_picker.dart';

class ImagesStep extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 300, child: CustomImagePicker(sectionLabel: "Ajoutez un minimum de 3 photos.", mutipleUploads: true,)),
          ],
        ),
      ),
    );
  }

}
