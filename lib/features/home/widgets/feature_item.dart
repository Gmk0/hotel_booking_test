import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';
import 'package:hotel_booking/core/utils/constants/texts.dart';
import 'package:hotel_booking/core/utils/data.dart';
import 'package:hotel_booking/features/home/widgets/custom_image.dart';
import 'package:hotel_booking/features/home/widgets/favorites_box.dart';
import 'package:lucide_icons/lucide_icons.dart';


import 'package:skeletonizer/skeletonizer.dart';


class FeatureItem extends StatelessWidget {
  FeatureItem(
      {Key? key,
     // required this.data,
      this.width = 280,
      this.height = 300,
      this.onTap,
      this.onTapFavorite})
      : super(key: key);
  //final RoomModel data;
  final double width;
  final double height;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
       // padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
               CustomImageAssets.hotel1,
              isNetwork: false,
              width: double.infinity,
              height: height *0.5,
              radius: 15,
            ),
            Container(
              width: width - 20,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Luxury villa kinshasa",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        color: textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(  Icons.place_outlined, size: 18,),
                      Expanded(
                        child: Text(
                          'Kinshasa, Rdc',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: labelColor, fontSize: 13),
                        ),
                      ),
                    
                    ],
                  ),
                  SizedBox(height: 10),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("32\$", style: TextStyle(
                            fontSize: 14,
                          ),),
                           Text("/night", style: TextStyle(
                            fontSize: 11,
                          ),),
                        ],
                      ),
                      Spacer(),

                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16,),
                          Text(
                            '4.8',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: labelColor, fontSize: 13),
                          ),
                        ],
                      ),
                    
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FeatureItemSkeleton extends StatelessWidget {
  FeatureItemSkeleton({
    Key? key,
    this.width = 280,
    this.height = 300,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              recommends[0]['image_asset'],
              isNetwork: false,
              width: double.infinity,
              height: 190,
              radius: 15,
            ),
            Container(
              width: width - 20,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CustomText.serviceTilte,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'chambre simple',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: labelColor, fontSize: 13),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '300',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      FavoriteBox(
                        size: 16,
                        onTap: () {},
                        isFavorited: false,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
