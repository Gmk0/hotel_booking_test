import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationBadgeWidget extends StatelessWidget {
  final Widget child;
  final int count;
  final bool showBadge;

  const NotificationBadgeWidget({
    super.key,
    required this.child,
    this.count = 0,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (showBadge && count > 0)
          Positioned(
            right: -1.w,
            top: -0.5.h,
            child: Container(
              padding: EdgeInsets.all(0.5.w),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              constraints: BoxConstraints(
                minWidth: 4.w,
                minHeight: 4.w,
              ),
              child: Text(
                count > 99 ? '99+' : count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
