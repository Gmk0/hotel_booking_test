import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class BookingCardWidget extends StatelessWidget {
  final Map<String, dynamic> booking;
  final VoidCallback? onTap;
  final VoidCallback? onViewDetails;
  final VoidCallback? onContactHost;
  final VoidCallback? onCancelBooking;

  const BookingCardWidget({
    super.key,
    required this.booking,
    this.onTap,
    this.onViewDetails,
    this.onContactHost,
    this.onCancelBooking,
  });

  @override
  Widget build(BuildContext context) {
    final status = booking['status'] as String;
    final isUpcoming = status == 'confirmed' || status == 'pending';
    final isPast = status == 'completed';
    final isCancelled = status == 'cancelled';

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPropertyImage(),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: _buildBookingInfo(),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                _buildBookingDetails(),
                SizedBox(height: 2.h),
                _buildActionButtons(isUpcoming, isPast, isCancelled),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CustomImageWidget(
        imageUrl: booking['image'] as String,
        width: 20.w,
        height: 15.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBookingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                booking['propertyName'] as String,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _buildStatusBadge(),
          ],
        ),
        SizedBox(height: 0.5.h),
        Row(
          children: [
            CustomIconWidget(
              iconName: 'location_on',
              color: AppTheme.textSecondary,
              size: 14,
            ),
            SizedBox(width: 1.w),
            Expanded(
              child: Text(
                booking['location'] as String,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppTheme.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Text(
          '#Reference: ${booking['confirmationNumber']}',
          style: TextStyle(
            fontSize: 11.sp,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge() {
    final status = booking['status'] as String;
    Color backgroundColor;
    Color textColor;
    String displayText;

    switch (status) {
      case 'confirmed':
        backgroundColor = AppTheme.accentGreen.withValues(alpha: 0.1);
        textColor = AppTheme.accentGreen;
        displayText = 'Confirmé';
        break;
      case 'pending':
        backgroundColor = AppTheme.ratingGold.withValues(alpha: 0.1);
        textColor = AppTheme.ratingGold;
        displayText = 'En attente';
        break;
      case 'cancelled':
        backgroundColor = Colors.red.withValues(alpha: 0.1);
        textColor = Colors.red;
        displayText = 'Annulée';
        break;
      case 'completed':
        backgroundColor = AppTheme.primaryBlue.withValues(alpha: 0.1);
        textColor = AppTheme.primaryBlue;
        displayText = 'Terminée';
        break;
      default:
        backgroundColor = AppTheme.borderSubtle;
        textColor = AppTheme.textSecondary;
        displayText = '';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildBookingDetails() {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  'check_in',
                  'Check-in',
                  booking['checkInDate'] as String,
                ),
              ),
              Container(
                width: 1,
                height: 4.h,
                color: AppTheme.borderSubtle,
              ),
              Expanded(
                child: _buildDetailItem(
                  'check_out',
                  'Check-out',
                  booking['checkOutDate'] as String,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  'people',
                  'Invités',
                  '${booking['guestCount']} invité(s)',
                ),
              ),
              Container(
                width: 1,
                height: 4.h,
                color: AppTheme.borderSubtle,
              ),
              Expanded(
                child: _buildDetailItem(
                  'attach_money',
                  'Total',
                  booking['totalPrice'] as String,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String iconName, String label, String value) {
    return Column(
      children: [
        CustomIconWidget(
          iconName: iconName,
          color: AppTheme.primaryBlue,
          size: 20,
        ),
        SizedBox(height: 0.5.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            color: AppTheme.textSecondary,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isUpcoming, bool isPast, bool isCancelled) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onViewDetails,
            icon: CustomIconWidget(
              iconName: 'visibility',
              color: AppTheme.primaryBlue,
              size: 16,
            ),
            label: Text('Détails'),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 1.h),
            ),
          ),
        ),
        SizedBox(width: 2.w),
        if (isUpcoming) ...[
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onContactHost,
              icon: CustomIconWidget(
                iconName: 'message',
                color: AppTheme.primaryBlue,
                size: 16,
              ),
              label: Text('Contact'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 1.h),
              ),
            ),
          ),
          SizedBox(width: 2.w),
          if (booking['status'] != 'pending')
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onCancelBooking,
                icon: CustomIconWidget(
                  iconName: 'cancel',
                  color: Colors.red,
                  size: 16,
                ),
                label: Text('Annuler'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.red),
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                ),
              ),
            ),
        ],
      ],
    );
  }
}
