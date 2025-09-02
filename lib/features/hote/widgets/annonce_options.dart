import 'package:flutter/material.dart';
import 'package:hotel_booking/core/app_export.dart';
import 'package:hotel_booking/features/hote/screens/publish_espace_screen.dart';
import 'package:hotel_booking/features/hote/screens/publish_service_screen.dart';

class AnnonceOptionScreen extends StatefulWidget
{
  const AnnonceOptionScreen({Key? key}) : super(key: key);

  @override
  State<AnnonceOptionScreen> createState() => _AnnonceOptionScreenState();
}

class _AnnonceOptionScreenState extends State<AnnonceOptionScreen> {
  String? _selected;

  final List<Map<String, dynamic>> _options = [
    {"label": "Logement", "icon":Icons.home_outlined},
    {"label": "Expérience", "icon":Icons.account_balance_outlined},
    {"label": "Service", "icon":Icons.cleaning_services},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Titre
          const Text(
            "Que souhaitez-vous proposer ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Options list
          ..._options.map((opt) {
            final isSelected = _selected == opt["label"];
            return GestureDetector(
              onTap: () {
                setState(() => _selected = opt["label"]);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: 15),
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? AppTheme.accentGreen : Colors.grey.shade300,
                    width: isSelected ? 2.5 : 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      opt["label"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Icon(opt['icon'],
                      color: Colors.grey,
                      size: 20,
                    )
                  ],
                ),
              ),
            );
          }).toList(),

          const SizedBox(height: 10),

          // Bottom button suivant.
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _selected == null ? null : () {

                switch(_selected){
                  case 'Logement':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PublishEspaceScreen()));
                    break;
                  case 'Expérience' : break;
                  case 'Service' : 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PublishServiceScreen()));
                    break;
                  default :break;
                }

              },
              child: const Text(
                "Suivant",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
