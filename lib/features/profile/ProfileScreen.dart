import 'package:flutter/material.dart';
import 'package:hotel_booking/features/profile/screens/ObtenirAideScreen.dart';
import 'package:hotel_booking/features/profile/screens/SettingsScreen.dart';
import 'package:hotel_booking/features/profile/widgets/MenuItem.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Profil",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Stack(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xFFF1F1F1),
                              radius: 20,
                              child: Icon(Icons.notifications_none, color: Colors.black54, size: 22),
                            ),
                            Positioned(
                              top: 6,
                              right: 6,
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Profil card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 38,
                                backgroundImage: AssetImage("assets/images/user-2.png"),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.pink,
                                  child: const Icon(Icons.check, size: 14, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 16),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Séjours Rdc", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              SizedBox(height: 4),
                              Text(
                                "Kinshasa, République\nDémocratique du Congo",
                                style: TextStyle(color: Colors.black54, fontSize: 14, height: 1.3),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const SizedBox(height: 14),

                    // Devenir host card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/house.jpeg", width: 32, height: 32),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Devenir hôte", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                SizedBox(height: 4),
                                Text(
                                  "Devenir hôte et gagner des revenus supplémentaires, c'est facile.",
                                  style: TextStyle(color: Colors.black54, fontSize: 14, height: 1.3),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Menu items
                    MenuItem(icon: Icons.settings_outlined, title: "Paramètres du compte",onClick: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                    },),
                    MenuItem(icon: Icons.help_outline, title: "Obtenir de l'aide",onClick: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ObtenirAideScreen()));
                    },),
                    MenuItem(icon: Icons.person_outline, title: "Voir le profil",onClick: (){

                    },),
                    MenuItem(icon: Icons.pan_tool_alt_outlined, title: "Confidentialité",onClick: (){

                    },),
                    const Divider(height: 24, thickness: 1, color: Color(0xFFE0E0E0)),
                    MenuItem(icon: Icons.group_outlined, title: "Parrainer un hôte",onClick: (){

                    },),
                    MenuItem(icon: Icons.group_add_outlined, title: "Trouver un co-hôte",onClick: (){

                    },),
                    MenuItem(icon: Icons.menu_book_outlined, title: "Juridique",onClick: (){

                    },),
                    MenuItem(icon: Icons.logout, title: "Déconnexion",onClick: (){

                    },),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


