import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/features/bookings/screens/EspaceBookingScreen.dart';
import 'package:hotel_booking/features/bookings/screens/HotelBookingScreen.dart';
import 'package:hotel_booking/features/bookings/screens/ServiceBookingScreen.dart';
import 'package:hotel_booking/widgets/Screen.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../core/utils/constants/image_strings.dart';
import '../../widgets/HeaderIcon.dart';
import './widgets/booking_card_widget.dart';
import './widgets/booking_filter_tabs_widget.dart';
import './widgets/empty_bookings_widget.dart';
import './widgets/notification_badge_widget.dart';

class BookingsScreen extends StatefulWidget
{
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> with SingleTickerProviderStateMixin
{
  /**
   * Sub-screens.
   */
  final List<Widget> _screens = [
    HotelBookingScreen(),
    EspaceBookingScreen(),
    ServiceBookingScreen()
  ];

  int _currentSubScreen = 0;

  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Mes reservations',
          style: AppTheme.lightTheme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        actions: [
          NotificationBadgeWidget(
            showBadge: 0 == 0,
            count: 1,
            child: IconButton(
              icon: CustomIconWidget(
                iconName: 'notifications',
                color: Colors.black,
                size: 24,
              ),
              onPressed: _showNotifications,
            ),
          ),
          SizedBox(width: 2.w),
        ],
      ),
      body: Screen(
        body:  RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //spacing: 4,
                    children: [
                      HeaderIcon(
                        icon: Icons.bed,
                        label: 'Hebergements',
                        onTap: () {
                          setState(() {
                            _currentSubScreen = 0;
                          });
                        },
                      ),
                      HeaderIcon(
                        icon: Icons.holiday_village,
                        label: 'Spaces',
                        onTap: () {
                          setState(() {
                            _currentSubScreen = 1;
                          });
                        },
                      ),
                      HeaderIcon(
                        icon: Icons.supervised_user_circle,
                        label: 'Services',
                        onTap: () {
                          setState(() {
                            _currentSubScreen = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: _screens[_currentSubScreen] //afficher le bon sub-screen.
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async
  {
    setState(() {
      _isRefreshing = true;
    });

    setState(() {
      _isRefreshing = false;
    });

    HapticFeedback.lightImpact();
  }

  void _showNotifications() {
    HapticFeedback.lightImpact();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Notifications'),
        content: Text(
            'Vous avez 1 reservation en attente de confirmation.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

}
