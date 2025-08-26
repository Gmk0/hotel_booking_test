import 'package:flutter/material.dart';
import 'package:hotel_booking/features/profile/widgets/MenuItem.dart';
import 'package:hotel_booking/widgets/Screen.dart';

import '../../widgets/circle_icon.dart';

class HoteMenuScreen extends StatelessWidget
{
  const HoteMenuScreen({super.key});

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _FloatingBtn(),
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          CircleIcon(
            icon: Icons.notifications_none_rounded,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage("assets/images/user-2.png"),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Screen(
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: _RevenueCard()),
                    const SizedBox(width: 14),
                    const Expanded(child: _HighlightsCard()),
                  ],
                ),

                const SizedBox(height: 26),

                MenuItem(
                    icon: Icons.chat_bubble_outline_rounded,
                    title: "Fonctionnalités en\navant-première",
                    onClick: (){}
                ),
                MenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Paramètres du compte',
                  onClick: () {},
                ),
                MenuItem(
                  icon: Icons.menu_book_outlined,
                  title: 'Ressources pour les hôtes',
                  onClick: () {},
                ),
                MenuItem(
                  icon: Icons.help_outline_rounded,
                  title: "Obtenir de l'aide",
                  onClick: () {},
                ),
                MenuItem(
                  icon: Icons.groups_outlined,
                  title: 'Trouver un co-hôte',
                  onClick: () {},
                ),
                MenuItem(
                  icon: Icons.add_rounded,
                  title: 'Créer une nouvelle annonce',
                  onClick: () {},
                ),

                const SizedBox(height: 20),
              ],
            ),
          )
      ),
    );
  }
}

class _RevenueCard extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return _CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Revenus',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          const Text(
            '\$27,16 à venir',
            style: TextStyle(fontSize: 16, color: Color(0xFF303030)),
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}

class _HighlightsCard extends StatelessWidget {
  const _HighlightsCard();

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Points',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.star_rounded, size: 18),
              SizedBox(width: 4),
              Text(
                '4,0 ·',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}

class _CardShell extends StatelessWidget {
  const _CardShell({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
        border: Border.all(color: Color(0x11000000)),
      ),
      child: child,
    );
  }
}

/**
 * Floating btn.
 */
class _FloatingBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.sync_alt_rounded, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Text(
            'Passer en mode client',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

