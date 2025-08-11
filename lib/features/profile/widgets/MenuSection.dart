import 'package:flutter/cupertino.dart';

class MenuSection extends StatelessWidget {
  final List<Widget> items;

  MenuSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    // Each item uses the SettingsListItem widget
    return Column(
        children: items
    );
  }
}