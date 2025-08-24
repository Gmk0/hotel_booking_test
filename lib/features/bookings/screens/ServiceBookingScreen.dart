import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';
import 'package:hotel_booking/features/bookings/widgets/ServiceBookingCard.dart';
import 'package:hotel_booking/widgets/Screen.dart';

class ServiceBookingScreen extends StatelessWidget
{
  /**
   * Simulation données commandes.
   */
  final orders = <OrderItem>[
    OrderItem(
      priceText: '19,33 \$US',
      title:
      'Design mobile app and web ui ux ,landing page ui in',
      sellerName: 'Gloire Kanda',
      dateText: '23 aout. 2025',
      statusText: 'TERMINÉ',
      thumbnail: CustomImageAssets.hotel3,
    ),
    OrderItem(
      priceText: '18,83 \$US',
      title:
      'Design mobile app and web ui ux ,landing page ui in',
      sellerName: 'Gloire Kanda',
      dateText: '25 aout. 2025',
      statusText: 'TERMINÉ',
      thumbnail: CustomImageAssets.hotel2,
    ),
  ];

  late BuildContext context;
  @override
  Widget build(BuildContext context)
  {
    return Screen(
        body: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) => Servicebookingcard(item: orders[i]),
        )
    );
  }

}





