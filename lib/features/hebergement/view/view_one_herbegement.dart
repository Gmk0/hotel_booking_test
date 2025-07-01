import 'package:flutter/material.dart';

// class ViewOneHerbegement extends StatelessWidget {
//   const ViewOneHerbegement({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar());
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/core/utils/constants/texts.dart';
import 'package:hotel_booking/core/utils/data.dart';
import 'package:hotel_booking/core/utils/widgets/custom_button.dart';
import 'package:hotel_booking/core/utils/widgets/facility_box.dart';
import 'package:hotel_booking/core/utils/widgets/icon_box.dart';
import 'package:hotel_booking/core/utils/widgets/section_heading.dart';
import 'package:hotel_booking/core/utils/widgets/slider_widget.dart';
import 'package:hotel_booking/features/home/widgets/card_room_mini.dart';
import 'package:hotel_booking/features/home/widgets/favorites_box.dart';

import 'package:hotel_booking/models/room_model.dart';

import 'package:image_stack/image_stack.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailChambre extends ConsumerStatefulWidget {
  DetailChambre({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailChambre> createState() => _DetailChambreState();
}

class _DetailChambreState extends ConsumerState<DetailChambre> {
  bool afficherCorps = false;
  double hauteurStack = 340;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // room = widget.data;

    // Lancer la récupération des détails
    // Future.microtask(() async {
    //   try {
    //     final updatedRoom =
    //         await ref.read(getRoomDetailNotifierProvider(room.id).future);

    //     setState(() {
    //       room = updatedRoom;
    //       isLoading = false; // On a fini de charger
    //     });
    //   } catch (e) {
    //     EasyLoading.showError(e.toString());
    //   }
    // });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        afficherCorps = true;
      });
    });
    // data["album_images"].insert(0, data["image"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: AnimatedCrossFade(
        firstChild: SingleChildScrollView(
          child: Column(
            children: [
              obtenirStack(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: obtenirEnTeteInfos(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: obtenirBoiteAvis(),
                  ),
                  SizedBox(height: 20),

                  SectionHeading(title: "Description", showAction: false),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      CustomText.serviceTilte,
                      style: TextStyle(height: 1.5, color: labelColor),
                    ),
                  ),
                  SizedBox(height: 15),

                  SectionHeading(
                    title: "Ce qu'ils proposent",
                    showAction: false,
                  ),

                  listeInstallations(),
                  SizedBox(height: 20),

                  SizedBox(height: 5),

                  SizedBox(height: 20),
                  SectionHeading(
                    title: "À propos de l'hôtel",
                    showAction: false,
                  ),

                  // ApproposHotel(ref: ref, room: room),

                  // 🔹 Nouvelle section "À propos de l'hôtel"
                  SizedBox(height: 10),

                  // getRecommend(),
                  SizedBox(height: 20),

                  SectionHeading(title: "D'autres ont vue", showAction: false),
                  getRecommend(),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
        secondChild: Container(),
        crossFadeState: afficherCorps
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 300),
      ),
      bottomNavigationBar: obtenirBoutons(),
      // floatingActionButton: obtenirBoutons(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  obtenirStack() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: hauteurStack,
      child: Stack(
        children: [
          SliderWidget(),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBox(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: darker,
                    ),
                    bgColor: Colors.white.withValues(alpha: 0.7),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 300,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: appBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ),
          Positioned(
            top: 285,
            right: 20,
            child: Row(
              spacing: 5,
              children: [
                FavoriteBox(
                  size: 18,
                  isFavorited: false,
                  onTap: () {
                    setState(() {});
                  },
                ),
                FavoriteBox(
                  size: 18,
                  isFavorited: false,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  obtenirEnTeteInfos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              CustomText.titleHotel,
              style: TextStyle(
                fontSize: 20,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              CustomText.price,
              style: TextStyle(
                fontSize: 18,
                color: primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Icon(Icons.place_outlined, color: labelColor, size: 13),
            SizedBox(width: 3),
            Text('Status', style: TextStyle(fontSize: 13, color: labelColor)),
            Spacer(),
            Text("par nuit", style: TextStyle(fontSize: 13, color: labelColor)),
          ],
        ),
      ],
    );
  }

  listeInstallations() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(
        children: [
          FacilityBox(info: "Lit Jumeau", icon: "assets/icons/bed.svg"),
          FacilityBox(info: "Wifi", icon: "assets/icons/wifi.svg"),
          FacilityBox(info: "Parking", icon: "assets/icons/car.svg"),
          FacilityBox(info: "Piscine", icon: "assets/icons/pool.svg"),
          FacilityBox(info: "Snack", icon: "assets/icons/snack.svg"),
          FacilityBox(info: "Petit-déjeuner", icon: "assets/icons/food.svg"),
        ],
      ),
    );
  }

  obtenirBoiteAvis() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: appBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.star, color: yellow, size: 18),
                  SizedBox(width: 5),
                  Text(
                    '343',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                "10 avis",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: labelColor, fontSize: 13),
              ),
            ],
          ),
          ImageStack(
            showTotalCount: true,
            extraCountTextStyle: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.normal,
            ),
            imageList: reviewers,
            totalCount: reviewers.length,
            imageRadius: 25,
            imageCount: 4,
            imageBorderWidth: 0.2,
          ),
        ],
      ),
    );
  }

  obtenirBoutons() {
    return Container(
      color: appBgColor,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconBox(
          //   bgColor: CustomColors.buttonPrimary,
          //   padding: 10,
          //   child: Icon(Icons.paid_rounded),
          // ),
          SizedBox(width: 15),
          Expanded(
            child: CustomButton(
              bgColor: CustomColors.darkGreen,
              radius: 15,
              title: "Réserver Maintenant",
              onTap: () {
                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   builder: (context) => BookingPage(
                //     roomName: room.name,
                //     room: room,
                //     pricePerNight: room.pricePerNight,
                //   ),
                // );
                // CustomHelperFunctions.navigateToScreen(
                //   context,
                //   BookingPage(
                //     roomName: data["name"] ?? "Chambre Deluxe",
                //     pricePerNight:
                //         double.tryParse(data["price"] ?? "200") ?? 200,
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Fonction pour afficher une chambre
  Widget chambreItem(String nom, String prix) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nom,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(prix, style: TextStyle(fontSize: 14, color: primary)),
        ],
      ),
    );
  }

  getRecommend() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              // data: recommends[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailChambre()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HotelItem extends StatelessWidget {
  final String title;
  final Widget value;
  const HotelItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        value,
      ],
    );
  }
}

// class ApproposHotel extends StatelessWidget {
//   final WidgetRef ref;
//   final RoomModel room;
//   const ApproposHotel({super.key, required this.ref, required this.room});

//   @override
//   Widget build(BuildContext context) {
//     final roomStateAsync = ref.watch(
//       getRoomDetailNotifierProvider(room.hotelId),
//     );
//     return roomStateAsync.when(
//       data: (hotel) => Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 HotelItem(
//                   title: "Nom :",
//                   value: Text(
//                     "Pas d'information",
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 // Text("⭐ Popularité : Très apprécié"),
//                 // SizedBox(height: 5),
//                 HotelItem(
//                   title: "Nombre d'étoiles:",
//                   value: Text(
//                     "5 ★★★★★",
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                 ),

//                 SizedBox(height: 5),

//                 HotelItem(
//                   title: "Localisation:",
//                   value: Text(
//                     "Kinshasa, Gombe",
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 // roomState.when(data: (data), error: error, loading: loading)
//                 Text(
//                   "🏖️ Niché au cœur de Kinshasa, l'Hôtel Prestige offre une "
//                   "expérience luxueuse avec des chambres élégantes, une vue imprenable sur la ville et "
//                   "des services haut de gamme. Idéal pour les voyageurs d'affaires et les touristes "
//                   "cherchant un séjour raffiné et inoubliable.",
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),

//           SectionHeading(
//             title: "Voir d'autres chambres de cet hôtel",
//             showAction: false,
//           ),

//           SingleChildScrollView(
//             padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: List.generate(
//                 hotel.rooms!.length,
//                 (index) => Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: RecommendItem(
//                     data: hotel.rooms![index],
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               DetailChambre(data: recommends[index]),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // 🔹 Nouvelle section "Voir d'autres chambres de cet hôtel"
//           SizedBox(height: 10),
//         ],
//       ),
//       error: (t, s) => Text('error'),
//       loading: () => Skeletonizer(
//         enabled: true,
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   HotelItem(
//                     title: "Nom :",
//                     value: Text(
//                       "Pas d'information",
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   // Text("⭐ Popularité : Très apprécié"),
//                   // SizedBox(height: 5),
//                   HotelItem(
//                     title: "Nombre d'étoiles:",
//                     value: Text(
//                       "5 ★★★★★",
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                   ),

//                   SizedBox(height: 5),

//                   HotelItem(
//                     title: "Localisation:",
//                     value: Text(
//                       "Kinshasa, Gombe",
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   // roomState.when(data: (data), error: error, loading: loading)
//                   Text(
//                     "🏖️ Niché au cœur de Kinshasa, l'Hôtel Prestige offre une "
//                     "expérience luxueuse avec des chambres élégantes, une vue imprenable sur la ville et "
//                     "des services haut de gamme. Idéal pour les voyageurs d'affaires et les touristes "
//                     "cherchant un séjour raffiné et inoubliable.",
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),

//             SectionHeading(
//               title: "Voir d'autres chambres de cet hôtel",
//               showAction: false,
//             ),

//             // 🔹 Nouvelle section "Voir d'autres chambres de cet hôtel"
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
