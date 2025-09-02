import 'package:flutter/material.dart';

import '../../../core/utils/constants/image_strings.dart';

class CalendarScreen extends StatelessWidget
{
  const CalendarScreen({super.key});

  final List<Map<String, String>> listings = const [
    {
      "title": "chambre confort et séc...",
      "status": "Publiée",
      "image": CustomImageAssets.hotel1
    },
    {
      "title": "Luxe Confort au Cœur de la Ville",
      "status": "Publiée",
      "image": CustomImageAssets.hotel1
    },
    {
      "title": "Luxe Confort au Cœur de la Ville",
      "status": "Publiée",
      "image": CustomImageAssets.hotel1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Calendriers",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: listings.length,
          itemBuilder: (context, index) {
            final item = listings[index];
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item["image"]!,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["status"]!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: List.generate(
                        20,
                            (i) => Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i == 8
                                ? Colors.red
                                : Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
