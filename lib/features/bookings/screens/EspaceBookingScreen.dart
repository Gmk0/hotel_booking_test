import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/widgets/Screen.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/theme/theme.dart' hide AppTheme;
import '../../../widgets/custom_icon_widget.dart';
import '../widgets/booking_card_widget.dart';
import '../widgets/booking_filter_tabs_widget.dart';
import '../widgets/empty_bookings_widget.dart';
import '../../../core/app_export.dart';

class EspaceBookingScreen extends StatefulWidget
{
  const EspaceBookingScreen({super.key});

  @override
  State<EspaceBookingScreen> createState() => _EspaceBookingScreenState();
}

class _EspaceBookingScreenState extends State<EspaceBookingScreen> with SingleTickerProviderStateMixin
{
  int _selectedTabIndex = 0;
  bool _isRefreshing = false;

  final List<String> _filterTabs = ['En cours', 'Passé', 'Annulée'];

  // données de simultation
  final List<Map<String, dynamic>> _allBookings = [
    {
      "id": 1,
      "propertyName": "Salle de fete Saphir",
      "image":CustomImageAssets.hotel8,
      "location": "Matonge, Victoire",
      "checkInDate": "14 aout 2025",
      "checkOutDate": "18 aout 2025",
      "guestCount": 1,
      "totalPrice": "\$450.00",
      "status": "confirmed",
      "confirmationNumber": "CNB001234",
      "hostName": "Gloire Kanda",
      "hostPhone": "+243810000000",
    },
    {
      "id": 2,
      "propertyName": "Centre Financier de Kinshasa",
      "image":CustomImageAssets.hotel7,
      "location": "Gombe,Kinshasa",
      "checkInDate": "20 aout 2025",
      "checkOutDate": "22 aout 2025",
      "guestCount": 1,
      "totalPrice": "\$450.00",
      "status": "confirmed",
      "confirmationNumber": "CNB001234",
      "hostName": "Gloire Kanda",
      "hostPhone": "+243810000000",
    },

  ];

  List<Map<String, dynamic>> get _filteredBookings {
    switch (_selectedTabIndex) {
      case 0: // Upcoming
        return ((_allBookings as List)
            .where((dynamic booking) =>
        (booking as Map<String, dynamic>)['status'] == 'confirmed' ||
            (booking)['status'] == 'pending')
            .toList() as List<Map<String, dynamic>>);
      case 1: // Past
        return ((_allBookings as List)
            .where((dynamic booking) =>
        (booking as Map<String, dynamic>)['status'] == 'completed')
            .toList() as List<Map<String, dynamic>>);
      case 2: // Cancelled
        return ((_allBookings as List)
            .where((dynamic booking) =>
        (booking as Map<String, dynamic>)['status'] == 'cancelled')
            .toList() as List<Map<String, dynamic>>);
      default:
        return [];
    }
  }

  int get _pendingBookingsCount
  {
    return ((_allBookings as List)
        .where((dynamic booking) =>
    (booking as Map<String, dynamic>)['status'] == 'pending')
        .length);
  }

  Widget build(BuildContext context)
  {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Expanded(
          child: _buildBookingsList(),
        ),
      ],
    );
  }

  Widget _buildBookingsList() {
    final filteredBookings = _filteredBookings;

    if (filteredBookings.isEmpty)
    {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: EdgeInsets.only(bottom: 2.h),
      itemCount: filteredBookings.length,
      itemBuilder: (context, index) {
        final booking = filteredBookings[index];

        return BookingCardWidget(
          booking: booking,
          onTap: () => _viewBookingDetails(booking),
          onViewDetails: () => _viewBookingDetails(booking),
          onContactHost: () => _contactHost(booking),
          onCancelBooking: () => _cancelBooking(booking),
        );
      },
    );
  }

  Widget _buildEmptyState()
  {
    String title;
    String subtitle;

    switch (_selectedTabIndex)
    {
      case 0: // En cours
        title = 'Aucune reservation';
        subtitle =
        "Vous n'avez aucune reservation en cours !";
        break;
      case 1: // Passée
        title = 'Aucune reservation';
        subtitle =
        "Vous n'avez aucune reservation passée !";
        break;
      case 2: // Annulée
        title = 'Aucune reservation';
        subtitle =
        "Vous n'avez aucune reservation annulée !";
        break;
      default:
        title = 'Aucune reservation';
        subtitle =
        "Vous n'avez aucune reservation !";
    }

    return Column(
      children: [
        Expanded(
            child: EmptyBookingsWidget(
              title: title,
              subtitle: subtitle,
            )
        )
      ],
    );
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _isRefreshing = true;
    });

    setState(() {
      _isRefreshing = false;
    });

    HapticFeedback.lightImpact();
  }

  void _viewBookingDetails(Map<String, dynamic> booking) {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildBookingDetailsSheet(booking),
    );
  }

  Widget _buildBookingDetailsSheet(Map<String, dynamic> booking) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.h),
            width: 12.w,
            height: 0.5.h,
            decoration: BoxDecoration(
              color: AppTheme.borderSubtle,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Information Reservation',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomImageWidget(
                    imageUrl: booking['image'] as String,
                    width: double.infinity,
                    height: 25.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  booking['propertyName'] as String,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    CustomIconWidget(
                      iconName: 'location_on',
                      color: AppTheme.textSecondary,
                      size: 16,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      booking['location'] as String,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                _buildDetailRow('#Reference',
                    booking['confirmationNumber'] as String),
                _buildDetailRow('Check-in', booking['checkInDate'] as String),
                _buildDetailRow('Check-out', booking['checkOutDate'] as String),
                _buildDetailRow('Invités', '${booking['guestCount']} invité(s)'),
                _buildDetailRow('Total ', booking['totalPrice'] as String),
                _buildDetailRow('Host', booking['hostName'] as String),
                _buildDetailRow('Téléphone', booking['hostPhone'] as String),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _contactHost(Map<String, dynamic> booking) {
    HapticFeedback.lightImpact();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Contacter le Host'),
        content:
        Text('Contacter ${booking['hostName']} au ${booking['hostPhone']}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Appeler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Message'),
          ),
        ],
      ),
    );
  }

  void _cancelBooking(Map<String, dynamic> booking) {
    HapticFeedback.lightImpact();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Annuler Reservation'),
        content: Text(
            'Etes-vous sure de vouloir annuler cette reservation ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Non'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _performCancelBooking(booking);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Oui'),
          ),
        ],
      ),
    );
  }

  void _performCancelBooking(Map<String, dynamic> booking) {
    setState(() {
      booking['status'] = 'cancelled';
    });
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reservation annulée !'),
        backgroundColor: Colors.red,
      ),
    );
  }

}