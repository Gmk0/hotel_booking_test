import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class EmptyBookingsWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const EmptyBookingsWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: CustomIconWidget(
                iconName: 'calendar_today',
                color: AppTheme.primaryBlue,
                size: 15.w,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),

          ],
        ),
      ),
    );
  }
}
