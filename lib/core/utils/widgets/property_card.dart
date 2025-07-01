import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';
import 'package:hotel_booking/features/hebergement/view/view_one_herbegement.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, this.height = 200, this.width = 250});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Favori + Type + Note
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  CustomImageAssets.hotel1,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Type badge
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.house, size: 16, color: Colors.green),
                      SizedBox(width: 4),
                      Text("House", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              // Favori
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {},
                    iconSize: 20,
                  ),
                ),
              ),
              // Rating
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      SizedBox(width: 4),
                      Text('4.5', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).push(MaterialPageRoute(builder: (context) => DetailChambre()));
            },
            child: const Text(
              'The Wave House',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.location_on, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  'Washington Square, New York...',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Infos rapides
          Row(
            children: const [
              _IconInfo(icon: Icons.bed, text: '3'),
              _IconInfo(icon: Icons.bathtub, text: '4'),
              _IconInfo(icon: Icons.local_parking, text: '2'),
              Spacer(),
              Text(
                '\$14,000',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[700]),
        const SizedBox(width: 4),
        Text(text),
        const SizedBox(width: 10),
      ],
    );
  }
}
