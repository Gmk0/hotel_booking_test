import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

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
                    label: 'House',
                    color: Colors.green,
                  ),
                  _TypeChip(
                    icon: Icons.villa,
                    label: 'Villa',
                    color: Colors.blueGrey,
                  ),
                  _TypeChip(
                    icon: Icons.hotel,
                    label: 'Hotel',
                    color: Colors.orange,
                  ),
                  _TypeChip(
                    icon: Icons.apartment,
                    label: 'Apartment',
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
