import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/app_export.dart';

class FavouritePropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;
  final bool isEditMode;
  final bool isSelected;
  final ValueChanged<bool>? onSelectionChanged;

  const FavouritePropertyCard({
    super.key,
    required this.property,
    this.onTap,
    this.onRemove,
    this.isEditMode = false,
    this.isSelected = false,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadowLight,
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEditMode ? null : onTap,
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSection(),
                  _buildContentSection(),
                ],
              ),
              if (isEditMode) _buildSelectionCheckbox(),
              if (!isEditMode) _buildFavoriteButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 20.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: CustomImageWidget(
          imageUrl: property['image'] as String? ?? '',
          width: double.infinity,
          height: 20.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property['name'] as String? ?? 'Nom hebergement',
            style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 0.5.h),
          Row(
            children: [
              CustomIconWidget(
                iconName: 'location_on',
                color: AppTheme.textSecondary,
                size: 16,
              ),
              SizedBox(width: 1.w),
              Expanded(
                child: Text(
                  property['location'] as String? ?? 'Location',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              _buildRatingSection(),
              Spacer(),
              _buildPriceSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection() {
    final rating = (property['rating'] as num?)?.toDouble() ?? 0.0;
    final reviewCount = property['reviewCount'] as int? ?? 0;

    return Row(
      children: [
        CustomIconWidget(
          iconName: 'star',
          color: AppTheme.ratingGold,
          size: 16,
        ),
        SizedBox(width: 1.w),
        Text(
          rating.toStringAsFixed(1),
          style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          '($reviewCount)',
          style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    final price = property['price'] as String? ?? '\$0';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          price,
          style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
            color: AppTheme.primaryBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'par nuit',
          style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectionCheckbox() {
    return Positioned(
      top: 2.w,
      left: 2.w,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Checkbox(
          value: isSelected,
          onChanged: onSelectionChanged != null 
              ? (bool? value) => onSelectionChanged!(value ?? false)
              : null,
          shape: CircleBorder(),
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Positioned(
      top: 2.w,
      right: 2.w,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          onPressed: onRemove,
          icon: CustomIconWidget(
            iconName: 'favorite',
            color: Colors.red,
            size: 20,
          ),
          padding: EdgeInsets.all(2.w),
          constraints: BoxConstraints(
            minWidth: 8.w,
            minHeight: 8.w,
          ),
        ),
      ),
    );
  }
}