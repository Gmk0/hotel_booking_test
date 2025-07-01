
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';
import 'package:hotel_booking/core/utils/constants/sizes.dart';
import 'package:hotel_booking/core/utils/constants/texts.dart';
import 'package:hotel_booking/models/room_model.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'custom_image.dart';
class RecommendItem extends StatelessWidget {
  RecommendItem({Key? key, this.onTap}) : super(key: key);
  // final RoomModel data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(
                 CustomImageAssets.hotel1,
                isNetwork: false,
                radius: 15,
                height: 80,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: CustomSize.sm,
                  children: [
                    Text(
                      CustomText.titleHotel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
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
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            "43",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              CustomText.price,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: primary,
                              ),
                            ),

                             Text(
                              "/night",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                               
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
