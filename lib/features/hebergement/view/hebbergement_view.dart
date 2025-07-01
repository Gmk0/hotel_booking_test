import 'package:flutter/material.dart';

import 'package:hotel_booking/core/utils/constants/colors.dart';

import 'package:hotel_booking/core/utils/widgets/property_card.dart';

import 'package:hotel_booking/features/hebergement/widget/search_header.dart';
import 'package:hotel_booking/features/home/widgets/card_room_mini.dart';

class HebergementView extends StatefulWidget {
  const HebergementView({super.key});

  @override
  State<HebergementView> createState() => _HebergementViewState();
}

class _HebergementViewState extends State<HebergementView> {
  final List<String> statuses = ['Tout', 'Hotel', 'Villa', 'Appartement'];
  int selectedCateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor, // CustomColors.scafold
      body: Column(
        children: [
          _buildAppBar(),
          //  _buildSearchAndTabs(),
          SearchHeader(),
          // _buildSearchAndTabs(),
          Expanded(
            child: IndexedStack(
              index: selectedCateIndex,
              children: List.generate(statuses.length, (index) {
                return _buildTabContent(index);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: const Text('Hébergements'),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    );
  }

  Widget _buildSearchAndTabs() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(statuses.length, (index) {
                final label = statuses[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(
                      label,
                      style: const TextStyle(color: Colors.white),
                    ),
                    selected: selectedCateIndex == index,
                    onSelected: (_) =>
                        setState(() => selectedCateIndex = index),
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                  ),
                );
              }),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(statuses.length, (index) {
                final label = statuses[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(
                      label,
                      style: const TextStyle(color: Colors.white),
                    ),
                    selected: selectedCateIndex == index,
                    onSelected: (_) =>
                        setState(() => selectedCateIndex = index),
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher un hébergement',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      ),
    );
  }

  Widget _buildTabContent(int index) {
    if (index == 1) {
      // "Tout"
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, idx) => RecommendItem(),
      );
    } else {
      // Hotel / Villa / Appartement
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Recommander'),
            _buildHorizontalFeatureList(),
            _buildSectionHeader('Le plus proche'),
            _buildHorizontalFeatureList(),
          ],
        ),
      );
    }
  }

  Widget _buildSectionHeader(String city) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            city,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text('Voir tout', style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  Widget _buildHorizontalFeatureList() {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (_, idx) => PropertyCard(),
        ),
      ),
    );
  }
}
