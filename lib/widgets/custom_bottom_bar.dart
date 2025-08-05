import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom BottomNavigationBar widget implementing gesture-responsive navigation
/// with haptic feedback for booking applications.
class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  late int _currentIndex;

  // Navigation items with routes
  final List<_BottomNavItem> _navItems = [
    _BottomNavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
      route: '/home-screen',
    ),
    _BottomNavItem(
      icon: Icons.favorite_border,
      activeIcon: Icons.favorite,
      label: 'Favourites',
      route: '/favourite-screen',
    ),
    _BottomNavItem(
      icon: Icons.calendar_today_outlined,
      activeIcon: Icons.calendar_today,
      label: 'Bookings',
      route: '/bookings-screen',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(CustomBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _currentIndex = widget.currentIndex;
    }
  }

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    // Haptic feedback for better user experience
    HapticFeedback.lightImpact();

    setState(() {
      _currentIndex = index;
    });

    // Navigate to the selected route
    Navigator.pushNamed(context, _navItems[index].route);

    // Call the callback if provided
    widget.onTap?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF1E1E1E) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.1),
            offset: Offset(0, -2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == _currentIndex;

              return Expanded(
                child: _buildNavItem(
                  item: item,
                  isSelected: isSelected,
                  onTap: () => _onItemTapped(index),
                  isDark: isDark,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required _BottomNavItem item,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    final primaryColor = Color(0xFF4A90E2);
    final unselectedColor = isDark ? Color(0xFFB0B0B0) : Color(0xFF7F8C8D);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with smooth transition
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: Icon(
                isSelected ? item.activeIcon : item.icon,
                key: ValueKey(isSelected),
                color: isSelected ? primaryColor : unselectedColor,
                size: 24,
              ),
            ),
            SizedBox(height: 4),
            // Label with color transition
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected ? primaryColor : unselectedColor,
              ),
              child: Text(item.label),
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal class to represent bottom navigation items
class _BottomNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String route;

  const _BottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.route,
  });
}
