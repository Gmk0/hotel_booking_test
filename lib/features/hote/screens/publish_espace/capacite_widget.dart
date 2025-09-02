import 'package:flutter/material.dart';

class EspaceCapaciteWidget extends StatefulWidget
{
  const EspaceCapaciteWidget({super.key});

  @override
  State<EspaceCapaciteWidget> createState() => _EspaceCapaciteWidgetState();
}

class _EspaceCapaciteWidgetState extends State<EspaceCapaciteWidget>
{
  int guests = 4;
  int chambres = 4;
  int lits = 5;
  int salleDeBains = 2;

  Widget _buildCounter({
    required String label,
    required int value,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
    bool showButtons = true,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (showButtons) ...[
              _squareButton(Icons.remove, onDecrement),
              _valueBox(value),
              _squareButton(Icons.add, onIncrement),
            ] else
              _valueBox(value, isExpanded: true),
          ],
        ),
      ],
    );
  }

  Widget _squareButton(IconData icon, VoidCallback onTap)
  {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }

  Widget _valueBox(int value, {bool isExpanded = false})
  {
    return Container(
      width: isExpanded ? 60 : 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Text(
        value.toString(),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Indiquez la capacité de votre logement.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCounter(
                label: "Voyageurs",
                value: guests,
                onIncrement: () =>
                    setState(() => guests = guests + 1),
                onDecrement: () =>
                    setState(() => guests = (guests > 0) ? guests - 1 : 0),
              ),
              _buildCounter(
                label: "Lits",
                value: lits,
                onIncrement: () {},
                onDecrement: () {},
                showButtons: false,
              ),
              _buildCounter(
                label: "Chambres",
                value: chambres,
                onIncrement: () =>
                    setState(() => chambres = chambres + 1),
                onDecrement: () =>
                    setState(() => chambres = (chambres > 0) ? chambres - 1 : 0),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCounter(
                label: "Salles de bain",
                value: salleDeBains,
                onIncrement: () =>
                    setState(() => salleDeBains = salleDeBains + 1),
                onDecrement: () =>
                    setState(() => salleDeBains = (salleDeBains > 0) ? salleDeBains - 1 : 0),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
