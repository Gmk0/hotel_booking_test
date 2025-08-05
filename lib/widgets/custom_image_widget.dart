import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../core/utils/constants/image_strings.dart';

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  final Widget? errorWidget;

  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    this.width = 60,
    this.height = 60,
    this.fit = BoxFit.cover,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Image.asset(imageUrl!,width: width,height: height,fit: fit,);
  }
}
