import 'package:flutter/material.dart';
import 'package:hotel_booking/core/app_export.dart';

class HoraireStep extends StatefulWidget
{
  const HoraireStep({super.key});

  @override
  State<HoraireStep> createState() => _HoraireStepState();
}

class _HoraireStepState extends State<HoraireStep>
{
  String selectedDuration = "30 minutes";
  final List<String> durations = [
    "15 minutes",
    "30 minutes",
    "45 minutes",
    "60 minutes",
  ];

  // Selected jours de travail
  final List<String> days = ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"];
  final Set<int> selectedDays = {0, 1, 2}; // Lun, Mar, Mer selected

  // Time tranche
  double startHour = 9;
  double endHour = 17;

  // Durée dropdown
  final List<String> durationsDisponibilite = [
    "15 minutes",
    "30 minutes",
    "45 minutes",
    "1 heure"
  ];
  String selectedDurationDisponibilite = "30 minutes";

  // Reservation mode
  String reservationMode = "Instantané";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre
            const Text(
              "Quand les voyageurs\npeuvent-ils réserver ?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 24),

            // Section: Horaires disponibles
            const Text(
              "Horaires disponibles",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "lundi – vendredi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "09:00 – 17:00",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.chevron_right, size: 28),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Add time tranche Button
            Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: const Center(
                child: Text(
                  "Ajouter un créneau",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Section: Durée
            const Text(
              "Durée",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Indiquez la durée du service aux voyageurs.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 14),

            // Durée Dropdown
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              //height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedDuration,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, size: 28),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  items: durations.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text("Durée\n$value",
                          style: const TextStyle(height: 1.4)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDuration = newValue!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 50,),

            _disponibiliteSection()
          ],
        ),
      ),
    );
  }

  Widget _disponibiliteSection()
  {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Jours de travail
            const Text("Jours de travail",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(days.length, (index) {
                final isSelected = selectedDays.contains(index);
                return ChoiceChip(
                  label: Text(days[index]),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      if (isSelected) {
                        selectedDays.remove(index);
                      } else {
                        selectedDays.add(index);
                      }
                    });
                  },
                  selectedColor: AppTheme.accentGreen,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        color: isSelected ? Colors.transparent : Colors.grey),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                );
              }),
            ),
            const Divider(height: 32),

            // Créneaux horaires
            const Text("Créneaux horaires personnalisés",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                _timeBox("${startHour.toInt()}:00"),
                Expanded(
                  child: Slider(
                    value: endHour,
                    min: 0,
                    max: 24,
                    divisions: 24,
                    activeColor: AppTheme.accentGreen,
                    onChanged: (value) {
                      setState(() {
                        endHour = value;
                      });
                    },
                  ),
                ),
                _timeBox("${endHour.toInt()}:00"),
              ],
            ),
            const Divider(height: 32),

            // Durée
            const Text("Durée par prestation",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: selectedDuration,
                isExpanded: true,
                underline: const SizedBox(),
                items: durations
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDuration = value!;
                  });
                },
              ),
            ),
            const Divider(height: 32),

            // Mode de réservation
            const Text("Mode de réservation",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _reservationButton("Instantané"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _reservationButton("Validation manuelle"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _timeBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }

  Widget _reservationButton(String text) {
    final isSelected = reservationMode == text;
    return GestureDetector(
      onTap: () => setState(() => reservationMode = text),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentGreen : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey.shade400),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
