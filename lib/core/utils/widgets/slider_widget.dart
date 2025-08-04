import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';
import 'package:hotel_booking/features/home/widgets/custom_image.dart';

class SliderWidget extends StatefulWidget {
  //final List<MediaModel> items;
  final Widget? safeArea;
  final double height;
  const SliderWidget({
    Key? key,
    //required this.items,
    this.safeArea,
    this.height = 320.0,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              height: widget.height,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setActiveDot(index);
              },
            ),
            items: List.generate(CustomImageAssets.imageRooms.length, (index) {
              return CustomImage(
                isNetwork: false,
                CustomImageAssets.imageRooms[index],
                width: double.infinity,
                height: double.infinity,
                radius: 0,
              );
            }),
          ),
        ),
        Positioned(
          bottom: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(CustomImageAssets.imageRooms.length, (idx) {
              return activeIndex == idx ? ActiveDot() : InactiveDot();
            }),
          ),
        ),
        if (widget.safeArea != null) SafeArea(child: widget.safeArea!),
      ],
    );
  }
}

class ActiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
