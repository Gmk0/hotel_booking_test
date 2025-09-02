import 'package:flutter/material.dart';

class EspaceDisponibiliteStep extends StatefulWidget
{
  const EspaceDisponibiliteStep({super.key});

  @override
  State<EspaceDisponibiliteStep> createState() => _EspaceDisponibiliteStepState();
}

class _EspaceDisponibiliteStepState extends State<EspaceDisponibiliteStep>
{
  final Set<int> selectedDays = {0, 1, 2}; // preselectionné (L, M, M)
  double startHour = 8.0;
  double endHour = 22.0;
  String reservationMode = "Instantané";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre
            const Center(
              child: Text(
                "Quand votre espace\nest-il disponible ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Day Selector
            const Text(
              "Jours disponibles",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            DaySelector(
              selectedDays: selectedDays,
              onToggle: (index) {
                setState(() {
                  if (selectedDays.contains(index)) {
                    selectedDays.remove(index);
                  } else {
                    selectedDays.add(index);
                  }
                });
              },
            ),

            const SizedBox(height: 30),

            // Time Selector
            const Text(
              "Horaires",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            TimeRangeSelector(
              startHour: startHour,
              endHour: endHour,
              onChanged: (start, end) {
                setState(() {
                  startHour = start;
                  endHour = end;
                });
              },
            ),

            const SizedBox(height: 20),

            // Reservation Mode
            const Text(
              "Mode de réservation",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ReservationModeSelector(
              selectedMode: reservationMode,
              onChanged: (mode) {
                setState(() {
                  reservationMode = mode;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}

class DaySelector extends StatelessWidget {
  final List<String> days = const ["L", "M", "M", "J", "V", "S", "D"];
  final Set<int> selectedDays;
  final Function(int) onToggle;

  const DaySelector({
    super.key,
    required this.selectedDays,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(days.length, (index) {
          final isSelected = selectedDays.contains(index);
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => onToggle(index),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                  color: isSelected ? Colors.black : Colors.white,
                ),
                child: Center(
                  child: isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : Text(
                    days[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class TimeRangeSelector extends StatelessWidget
{
  final double startHour;
  final double endHour;
  final Function(double, double) onChanged;

  const TimeRangeSelector({
    super.key,
    required this.startHour,
    required this.endHour,
    required this.onChanged,
  });

  String formatHour(double value)
  {
    final hour = value.floor();
    final minutes = ((value - hour) * 60).round();
    return "${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        Center(
          child: Text(
            "${formatHour(startHour)} - ${formatHour(endHour)}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        RangeSlider(
          min: 0,
          max: 24,
          divisions: 24,
          activeColor: Colors.blueAccent,
          values: RangeValues(startHour, endHour),
          onChanged: (RangeValues values) {
            onChanged(values.start, values.end);
          },
        ),
      ],
    );
  }
}

class ReservationModeSelector extends StatelessWidget
{
  final String selectedMode;
  final Function(String) onChanged;

  const ReservationModeSelector({
    super.key,
    required this.selectedMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final modes = ["Instantané", "Validation manuelle"];

    return Column(
      children: modes.map((mode) {
        final isSelected = selectedMode == mode;
        return GestureDetector(
          onTap: () => onChanged(mode),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                // Custom radio circle
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.blueAccent : Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                    ),
                  )
                      : null,
                ),
                const SizedBox(width: 12),

                // Text
                Text(
                  mode,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}


