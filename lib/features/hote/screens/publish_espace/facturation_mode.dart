import 'package:flutter/material.dart';

class FacturationModeStep extends StatefulWidget
{
  const FacturationModeStep({super.key});

  @override
  State<FacturationModeStep> createState() => _FacturationModeStepState();
}

class _FacturationModeStepState extends State<FacturationModeStep>
{
  String selectedMode = "weekend";
  bool customPack = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre
              const Text(
                "Définir le mode\nde facturation",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 30),

              // Selection buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildModeButton(
                    icon: Icons.timer,
                    label: "À l'heure",
                    selected: selectedMode == "hour",
                    onTap: () {
                      setState(() {
                        selectedMode = "hour";
                      });
                    },
                  ),
                  _buildModeButton(
                    icon: Icons.calendar_today,
                    label: "À la journée",
                    selected: selectedMode == "day",
                    onTap: () {
                      setState(() {
                        selectedMode = "day";
                      });
                    },
                  ),
                  _buildModeButton(
                    icon: Icons.nightlight_round,
                    label: "Au week-end",
                    selected: selectedMode == "weekend",
                    onTap: () {
                      setState(() {
                        selectedMode = "weekend";
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Custom Pack
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: customPack,
                      onChanged: (val) {
                        setState(() {
                          customPack = val ?? false;
                        });
                      },
                    ),
                    const Text(
                      "Pack personnalisé",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Options",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Options list
              _buildOptionTile(
                title: "Ajouter réductions",
                subtitle: "(hebdo, mensuel, longue durée)",
              ),
              const SizedBox(height: 12),
              _buildOptionTile(
                title: "Taxes/frais supplémentaires",
                subtitle: "(caution, nettoyage)",
              ),

            ],
          ),
        ),
      ),
    );
  }

  // Mode selection button
  Widget _buildModeButton({required IconData icon, required String label, required bool selected, required VoidCallback onTap, })
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF3B82F6).withOpacity(0.15) : Colors.white,
          border: Border.all(
            color: selected ? const Color(0xFF3B82F6) : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: selected ? const Color(0xFF3B82F6) : Colors.black54,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: selected ? const Color(0xFF3B82F6) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Option Tile
  Widget _buildOptionTile({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.black, size: 22),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
