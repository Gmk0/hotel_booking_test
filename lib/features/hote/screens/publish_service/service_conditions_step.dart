import 'package:flutter/material.dart';
import 'package:hotel_booking/core/app_export.dart';

class ConditionsStep extends StatefulWidget
{
  const ConditionsStep({super.key});

  @override
  State<ConditionsStep> createState() => _ConditionsStepState();
}

class _ConditionsStepState extends State<ConditionsStep>
{
  String selectedPolicy = "Flexible";
  final Map<String, bool> conditions = {
    "Acompte 30%": true,
    "Matériel fourni par client": false,
    "Frais de déplacement": true,
  };

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre
              const Center(
                child: Text(
                  "Définissez les conditions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              PolicySelector(
                options: const ["Flexible", "Modérée", "Stricte"],
                selected: selectedPolicy,
                onChanged: (val) {
                  setState(() => selectedPolicy = val);
                },
              ),
              const SizedBox(height: 24),

              const Divider(thickness: 1),
              const SizedBox(height: 16),

              // Conditions Special
              const Text(
                "Conditions spéciales",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              Column(
                children: conditions.keys.map((key) {
                  return CustomCheckboxTile(
                    label: key,
                    value: conditions[key]!,
                    onChanged: (val) {
                      setState(() {
                        conditions[key] = val;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),

              // button enregistrer
              AnimatedButton(
                label: "Enregistrer",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PolicySelector extends StatelessWidget
{
  final List<String> options;
  final String selected;
  final Function(String) onChanged;

  const PolicySelector({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.map((option) {
        final isSelected = option == selected;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(option),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.accentGreen : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppTheme.accentGreen : Colors.grey.shade400,
                ),
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                child: Center(child: Text(option)),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Animated custom checkbox
class CustomCheckboxTile extends StatefulWidget
{
  final String label;
  final bool value;
  final Function(bool) onChanged;

  const CustomCheckboxTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCheckboxTile> createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutBack,
        ));
    if (widget.value) _controller.forward();
  }

  @override
  void didUpdateWidget(CustomCheckboxTile oldWidget)
  {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      widget.value ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.value
                        ? AppTheme.accentGreen
                        : Colors.grey.shade500,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(6),
                  color: widget.value ? AppTheme.accentGreen : Colors.white,
                ),
                child: widget.value
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.label,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Animated button
class AnimatedButton extends StatefulWidget
{
  final String label;
  final VoidCallback onPressed;

  const AnimatedButton({super.key, required this.label, required this.onPressed});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.05,
    );
  }

  void _onTapDown(TapDownDetails details)
  {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details)
  {
    _controller.reverse();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final scale = 1 - _controller.value;
          return Transform.scale(scale: scale, child: child);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppTheme.accentGreen,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
