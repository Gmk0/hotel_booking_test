// import 'package:flutter/material.dart';
// // import 'package:hotel_booking/models/room_model.dart';
// // import 'package:hotel_booking/theme/color.dart';
// // import 'package:hotel_booking/utils/constants/image_strings.dart';
// // import 'package:hotel_booking/utils/data.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'custom_image.dart';

// class RecommendItem extends StatelessWidget {
//   RecommendItem({Key? key, required this.data, this.onTap}) : super(key: key);
//   final RoomModel data;
//   final GestureTapCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//           margin: EdgeInsets.only(right: 10),
//           padding: EdgeInsets.all(10),
//           width: 300,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withValues(alpha: 0.1),
//                 spreadRadius: 1,
//                 blurRadius: 1,
//                 offset: Offset(1, 1), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               CustomImage(
//                 data.media!.isNotEmpty
//                     ? data.media![0].url
//                     : CustomImageAssets.hotel1,
//                 isNetwork: data.media!.isNotEmpty,
//                 radius: 15,
//                 height: 80,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       data.name,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           color: textColor,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'chambre double',
//                       style: TextStyle(fontSize: 12, color: labelColor),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           size: 14,
//                           color: yellow,
//                         ),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Expanded(
//                           child: Text(
//                             "43",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                         ),
//                         Text(
//                           data.pricePerNight.toString(),
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: primary,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }

// class RecommendItemSkeleton extends StatelessWidget {
//   RecommendItemSkeleton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: true,
//       child: Container(
//           margin: EdgeInsets.only(right: 10),
//           padding: EdgeInsets.all(10),
//           width: 300,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withValues(alpha: 0.1),
//                 spreadRadius: 1,
//                 blurRadius: 1,
//                 offset: Offset(1, 1), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               CustomImage(
//                 recommends[0]["image_asset"],
//                 isNetwork: false,
//                 radius: 15,
//                 height: 80,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       recommends[0]["name"],
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           color: textColor,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       recommends[0]["type"],
//                       style: TextStyle(fontSize: 12, color: labelColor),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           size: 14,
//                           color: yellow,
//                         ),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Expanded(
//                           child: Text(
//                             recommends[0]["rate"],
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                         ),
//                         Text(
//                           recommends[0]["price"],
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: primary,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
