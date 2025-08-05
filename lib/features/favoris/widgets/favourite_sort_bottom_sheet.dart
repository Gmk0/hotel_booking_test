import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/app_export.dart';

enum SortOption {
  recentlyAdded,
  price,
  rating,
  location,
}

class FavouriteSortBottomSheet extends StatefulWidget {
  final SortOption currentSort;
  final ValueChanged<SortOption>? onSortChanged;

  const FavouriteSortBottomSheet({
    super.key,
    required this.currentSort,
    this.onSortChanged,
  });

  @override
  State<FavouriteSortBottomSheet> createState() =>
      _FavouriteSortBottomSheetState();
}

class _FavouriteSortBottomSheetState extends State<FavouriteSortBottomSheet> {
  late SortOption _selectedSort;

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.currentSort;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          _buildSortOptions(),
          _buildActionButtons(),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppTheme.borderSubtle,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            'Sort by',
            style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: CustomIconWidget(
              iconName: 'close',
              color: AppTheme.textSecondary,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          _buildSortOption(
            option: SortOption.recentlyAdded,
            title: 'Recently Added',
            subtitle: 'Show newest favourites first',
            icon: 'schedule',
          ),
          _buildSortOption(
            option: SortOption.price,
            title: 'Price',
            subtitle: 'Sort by price (low to high)',
            icon: 'attach_money',
          ),
          _buildSortOption(
            option: SortOption.rating,
            title: 'Rating',
            subtitle: 'Show highest rated first',
            icon: 'star',
          ),
          _buildSortOption(
            option: SortOption.location,
            title: 'Location',
            subtitle: 'Sort by distance from you',
            icon: 'location_on',
          ),
        ],
      ),
    );
  }

  Widget _buildSortOption({
    required SortOption option,
    required String title,
    required String subtitle,
    required String icon,
  }) {
    final isSelected = _selectedSort == option;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedSort = option;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Row(
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primaryBlue.withValues(alpha: 0.1)
                      : AppTheme.borderSubtle.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CustomIconWidget(
                    iconName: icon,
                    color: isSelected
                        ? AppTheme.primaryBlue
                        : AppTheme.textSecondary,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected
                            ? AppTheme.primaryBlue
                            : AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      subtitle,
                      style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                CustomIconWidget(
                  iconName: 'check_circle',
                  color: AppTheme.primaryBlue,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                widget.onSortChanged?.call(_selectedSort);
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
