import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom AppBar widget implementing Contemporary Spatial Minimalism
/// with Trust-Forward Gradient System for booking applications.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showSearchField;
  final VoidCallback? onSearchTap;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;
  final String? searchHint;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchSubmitted;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showSearchField = false,
    this.onSearchTap,
    this.actions,
    this.centerTitle = false,
    this.leading,
    this.searchHint = 'Recherche hebergement...',
    this.searchController,
    this.onSearchChanged,
    this.onSearchSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4A90E2), // Primary blue
            Color(0xFF357ABD), // Secondary blue
          ],
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: centerTitle,
        leading: leading ?? (showBackButton ? _buildBackButton(context) : null),
        title:
            showSearchField ? _buildSearchField(context) : _buildTitle(context),
        actions: actions,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, size: 20),
      onPressed: () => Navigator.of(context).pop(),
      tooltip: 'Back',
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: -0.2,
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: TextField(
        controller: searchController,
        onChanged: onSearchChanged,
        onSubmitted: (value) => onSearchSubmitted?.call(),
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: searchHint,
          hintStyle: GoogleFonts.inter(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white.withValues(alpha: 0.7),
            size: 20,
          ),
          suffixIcon: searchController?.text.isNotEmpty == true
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white.withValues(alpha: 0.7),
                    size: 20,
                  ),
                  onPressed: () {
                    searchController?.clear();
                    onSearchChanged?.call('');
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
