import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/Screen.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/theme/theme.dart';

class ServiceDetailsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Service',
          style: AppTheme.lightTheme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        actions: [
        ],
      ),
      body: Screen(
          body: Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Expanded(child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Évaluation du prestataire
                      ExpansionTile(
                        initiallyExpanded: true,
                        leading: const Icon(Icons.star_border_outlined, color: Colors.black87),
                        title: const Text(
                          'Évaluation du prestataire',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        childrenPadding: const EdgeInsets.only(left: 40, bottom: 12),
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundImage: AssetImage("assets/images/user-2.png"),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Gloire KANDA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Merci 🥰',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: const [
                                    Icon(Icons.star, color: Colors.amber, size: 20),
                                    Icon(Icons.star, color: Colors.amber, size: 20),
                                    Icon(Icons.star, color: Colors.amber, size: 20),
                                    Icon(Icons.star, color: Colors.amber, size: 20),
                                    Icon(Icons.star, color: Colors.amber, size: 20),
                                    SizedBox(width: 6),
                                    Text(
                                      '5.0',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.translate, size: 18),
                              label: const Text('Traduire en Français'),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black87,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Mon avis
                      ExpansionTile(
                        leading: const Icon(Icons.star_outline_rounded, color: Colors.black87),
                        title: const Text(
                          'Mon avis',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        childrenPadding: const EdgeInsets.only(left: 40, bottom: 12),
                        children: const [
                          Text('Contenu de mon avis...'),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Voici votre livraison
                      ExpansionTile(
                        leading: const Icon(Icons.inventory_2_outlined, color: Colors.black87),
                        title: const Text(
                          'Voici votre livraison',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        childrenPadding: const EdgeInsets.only(left: 40, bottom: 12),
                        children: const [
                          Text('Contenu de la livraison...'),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Date de livraison
                      ListTile(
                        leading: const Icon(Icons.event_available_outlined, color: Colors.black87),
                        title: const Text(
                          'Votre date de livraison a été mise à jour pour le 30/08/2025',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Commande en cours
                      const ListTile(
                        leading: Icon(Icons.assignment_outlined, color: Colors.black87),
                        title: Text(
                          'Commande en cours',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Critères de commande
                      const ListTile(
                        leading: Icon(Icons.edit_note_outlined, color: Colors.black87),
                        title: Text(
                          'Critères de commande soumises',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                        border: Border.all(color: Colors.grey)
                    ),
                    height: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage("assets/images/user-2.png"),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Message',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            color: Colors.white,
            height: 80.h,
          )
      ),
    );
  }

}