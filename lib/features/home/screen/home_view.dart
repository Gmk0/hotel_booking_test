import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/core/utils/widgets/property_card.dart';
import 'package:hotel_booking/features/espaces/view/espaces_view.dart';
import 'package:hotel_booking/features/hebergement/view/hebbergement_view.dart';
import 'package:hotel_booking/features/home/widgets/card_room_mini.dart';
import 'package:hotel_booking/features/home/widgets/feature_item.dart';
import 'package:hotel_booking/features/services/view/services_view.dart';
import 'package:hotel_booking/images.dart';

class CongoBnbHomePage extends StatelessWidget {
  const CongoBnbHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF003320);

    return Scaffold(
      backgroundColor: CustomColors.scafold,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 350,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Header vert avec logo + search bar
                  Container(
                    height: 280,
                    color: darkGreen,
                    padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.logo, width: 80),
                            const SizedBox(width: 8),

                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Congo\n',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'BnB',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFD4A63D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.black54),
                              hintText: 'Where are you going?',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Fond blanc arrondi

                  // Icônes entre header et body (moitié dans le vert, moitié dans le blanc)
                  Positioned(
                    top: 210,
                    left: 0,
                    right: 0,
                    bottom: 3,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 4,
                          children: [
                            _HeaderIcon(
                              icon: Icons.bed,
                              label: 'Hebergements',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HebergementView(),
                                  ),
                                );
                              },
                            ),
                            _HeaderIcon(
                              icon: Icons.holiday_village,
                              label: 'Spaces',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EspacesView(),
                                  ),
                                );
                              },
                            ),
                            _HeaderIcon(
                              icon: Icons.supervised_user_circle,
                              label: 'Services',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServicesView(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Section Featured
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  decoration: const BoxDecoration(
                    //   color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text('See all', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, index) => SizedBox(width: 8),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return PropertyCard(
                          width: 200,
                          height: 179,

                          // onTapFavorite: () {},
                          // onTap: () {},
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  decoration: const BoxDecoration(
                    //   color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text('See all', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, index) => SizedBox(width: 8),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return FeatureItem(
                        width: 160,
                        height: 179,

                        onTapFavorite: () {},
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  decoration: const BoxDecoration(
                    //   color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text('See all', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, index) => SizedBox(width: 8),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return FeatureItem(
                        width: 160,
                        height: 179,

                        onTapFavorite: () {},
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Nearby
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Nearby',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('See all', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 6, 8),

                child: RecommendItem(),
              ),
              childCount: 8,
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: SizedBox(height: 80),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback? onTap;

  const _HeaderIcon({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color.fromARGB(255, 0, 26, 17);
    const gold = Color(0xFFD4A63D);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: gold, size: 40),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
