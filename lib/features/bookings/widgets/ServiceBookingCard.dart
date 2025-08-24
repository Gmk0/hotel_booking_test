import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class Servicebookingcard extends StatelessWidget
{
  final OrderItem item;
  late BuildContext context;

  Servicebookingcard({super.key, required this.item});


  @override
  Widget build(BuildContext context)
  {
    this.context = context;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0x11000000)),
      ),
      child: GestureDetector(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Thumbnail(url: item.thumbnail),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.priceText,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 4),
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Color(0xFF252525),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const _Avatar(),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.sellerName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            _StatusPill(text: item.statusText, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.more_vert_rounded),
                    onPressed: () {},
                    splashRadius: 18,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
              child: Row(
                children: [
                  Text(
                    item.dateText,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF606060),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_vert_rounded),
                    onPressed: () {},
                    splashRadius: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: (){
          _viewServiceBookingDetails();
        },
      ),
    );
  }

  void _viewServiceBookingDetails()
  {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _serviceDetails(),
    );
  }

  Widget _serviceDetails()
  {
    return Container(
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
    );
  }

}

class OrderItem {
  final String priceText;
  final String title;
  final String sellerName;
  final String dateText;
  final String statusText;
  final String thumbnail;

  OrderItem({
    required this.priceText,
    required this.title,
    required this.sellerName,
    required this.dateText,
    required this.statusText,
    required this.thumbnail,
  });
}

class _Thumbnail extends StatelessWidget
{
  const _Thumbnail({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        url,
        fit: BoxFit.cover,
        width: 68,
        height: 68,
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 14,
      backgroundImage: AssetImage("assets/images/user-2.png"),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String text;
  final Color color;

  const _StatusPill({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.2,
          color: color,
        ),
      ),
    );
  }
}
