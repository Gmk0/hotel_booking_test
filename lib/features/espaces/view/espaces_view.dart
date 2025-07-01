import 'package:flutter/material.dart';

import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';
import 'package:hotel_booking/core/utils/data.dart';
import 'package:hotel_booking/core/utils/widgets/property_card.dart';
import 'package:hotel_booking/features/hebergement/widget/search_delegate.dart';
import 'package:hotel_booking/features/home/widgets/card_room_mini.dart';

class EspacesView extends StatefulWidget {
  const EspacesView({super.key});

  @override
  State<EspacesView> createState() => _EspacesViewState();
}

class _EspacesViewState extends State<EspacesView> {
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
          SearchHeaderEspace(),
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
      title: const Text('Espaces'),
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

class SearchHeaderEspace extends StatelessWidget {
  const SearchHeaderEspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Localisation
          // Row(
          //   children: [
          //     const Icon(Icons.location_on, color: Colors.green),
          //     const SizedBox(width: 4),
          //     const Text(
          //       'Washington Square, New York...',
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     const Icon(Icons.arrow_drop_down),
          //     const Spacer(),
          //     const Icon(Icons.notifications, color: Colors.black54),
          //   ],
          // ),
          // const SizedBox(height: 12),

          // Barre de recherche
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What are you looking for?',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.mic),
                        SizedBox(width: 8),
                        Icon(Icons.tune),
                        SizedBox(width: 12),
                      ],
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Boutons logement
          SizedBox(
            height: 50,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _TypeChip(
                    icon: Icons.house,
                    label: 'Salle de fete',
                    color: Colors.green,
                  ),
                  _TypeChip(
                    icon: Icons.villa,
                    label: 'Salles polyvalentes',
                    color: Colors.blueGrey,
                  ),
                  _TypeChip(
                    icon: Icons.hotel,
                    label: 'Sales de reunion',
                    color: Colors.orange,
                  ),
                  _TypeChip(
                    icon: Icons.apartment,
                    label: 'Espace exterieurs',
                    color: Colors.indigo,
                  ),
                  _TypeChip(
                    icon: Icons.apartment,
                    label: 'Espace evenementiels',
                    color: Colors.indigo,
                  ),
                  _TypeChip(
                    icon: Icons.apartment,
                    label: 'Salles de reunion',
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Filtres
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _FilterChip(label: 'Gombe', icon: Icons.location_city),
                _FilterChip(label: 'Ngaliema', icon: Icons.location_city),
                _FilterChip(label: 'Kintambo', icon: Icons.location_city),
                _FilterChip(label: 'Limete', icon: Icons.location_city),
                _FilterChip(label: 'Masina', icon: Icons.location_city),
                _FilterChip(label: 'Mont Ngafula', icon: Icons.location_city),
                _FilterChip(label: 'Matete', icon: Icons.location_city),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _TypeChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _FilterChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [Icon(icon, size: 16), const SizedBox(width: 4), Text(label)],
      ),
    );
  }
}
