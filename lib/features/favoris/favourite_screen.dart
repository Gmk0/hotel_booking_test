import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/core/utils/constants/image_strings.dart';
import 'package:hotel_booking/widgets/Screen.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import './widgets/favoris_hebergement_card.dart';
import './widgets/favoris_search_bar.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with TickerProviderStateMixin
{
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isEditMode = false;
  bool _isRefreshing = false;
  String _searchQuery = '';
  Set<int> _selectedProperties = {};

  // données de teste.
  final List<Map<String, dynamic>> _allFavouriteProperties = [
    {
      "id": 1,
      "name": "Hotel Saphir",
      "location": "Victoire, Matonge",
      "image":CustomImageAssets.hotel1,
      "price": "\$450",
      "rating": 4.8,
      "reviewCount": 124,
      "dateAdded": DateTime.now().subtract(Duration(days: 2)),
      "distance": 2.5,
    },
    {
      "id": 2,
      "name": "Hilton Hotel",
      "location": "Gombe Kinshasa",
      "image":CustomImageAssets.hotel2,
      "price": "\$180",
      "rating": 4.6,
      "reviewCount": 89,
      "dateAdded": DateTime.now().subtract(Duration(days: 5)),
      "distance": 1.2,
    },
    {
      "id": 3,
      "name": "Fleuve Congo Hotel",
      "location": "Gombe, Kinshasa",
      "image":CustomImageAssets.hotel3,
      "price": "\$220",
      "rating": 4.9,
      "reviewCount": 156,
      "dateAdded": DateTime.now().subtract(Duration(days: 1)),
      "distance": 45.8,
    },
    {
      "id": 4,
      "name": "Memling",
      "location": "Gombe, Kinshasa",
      "image":CustomImageAssets.hotel4,
      "price": "\$320",
      "rating": 4.7,
      "reviewCount": 203,
      "dateAdded": DateTime.now().subtract(Duration(days: 7)),
      "distance": 8.3,
    },
    {
      "id": 5,
      "name": "Leon Hotel",
      "location": "Gombe, Kinshasa",
      "image":CustomImageAssets.hotel5,
      "price": "\$380",
      "rating": 4.5,
      "reviewCount": 78,
      "dateAdded": DateTime.now().subtract(Duration(days: 3)),
      "distance": 3.7,
    },
  ];

  List<Map<String, dynamic>> get _filteredProperties {
    List<Map<String, dynamic>> filtered = _allFavouriteProperties;

    // Filtre
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((property) {
        final name = (property['name'] as String).toLowerCase();
        final location = (property['location'] as String).toLowerCase();
        final query = _searchQuery.toLowerCase();
        return name.contains(query) || location.contains(query);
      }).toList();
    }


    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _toggleEditMode() {
    HapticFeedback.lightImpact();
    setState(() {
      _isEditMode = !_isEditMode;
      if (!_isEditMode) {
        _selectedProperties.clear();
      }
    });
  }

  void _onPropertySelectionChanged(int propertyId, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedProperties.add(propertyId);
      } else {
        _selectedProperties.remove(propertyId);
      }
    });
  }

  /**
   * Function pour retirer les hebergements selectionnés du favoris.
   */
  void _removeSelectedProperties() {
    if (_selectedProperties.isEmpty) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Retirer du favoris'),
        content: Text(
            'Voulez-vous vraiment retirer ${_selectedProperties.length} ${_selectedProperties.length == 1 ? 'hebergement' : 'hebergements'} de vos favoris?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _allFavouriteProperties.removeWhere(
                  (property) => _selectedProperties.contains(property['id']),
                );
                _selectedProperties.clear();
                _isEditMode = false;
              });
              Navigator.pop(context);
              _showSnackBar('Hebergement retiré de vos favoris ');
            },
            child: Text('Retirer'),
          ),
        ],
      ),
    );
  }

  /**
   * Retirer un hebergement du favoris.
   */
  void _removeProperty(int propertyId)
  {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Retirer du favoris'),
        content: Text(
            'Voulez-vous vraiement retirer cet hebergement de vos favoris?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _allFavouriteProperties
                    .removeWhere((property) => property['id'] == propertyId);
              });
              Navigator.pop(context);
              _showSnackBar('Hebergement retiré !');
            },
            child: Text('Retirer'),
          ),
        ],
      ),
    );
  }

  /**
   * Simulation  chargement des données.
   */
  Future<void> _onRefresh() async {
    setState(() {
      _isRefreshing = true;
    });

    // Simulation d'une requete HTTP.
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _isRefreshing = false;
    });

    _showSnackBar('Liste des favoris mis à jour');
  }

  /**
   * Afficher un SnackBar notification.
   */
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(4.w),
      ),
    );
  }

  /**
   * Fonction pour naviguer vers l'ecran de visualisation de l'hebergement en detail.
   * @args: un Map contenant toutes les informations/données de l'hebergement à voir.
   */
  void _navigateToPropertyDetail(Map<String, dynamic> property)
  {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: Screen(body: _buildBody()),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Mes favoris',
        style: AppTheme.lightTheme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppTheme.textPrimary,
        ),
      ),
      actions: [
        if (_allFavouriteProperties.isNotEmpty)
          TextButton(
            onPressed: _toggleEditMode,
            child: Text(
              _isEditMode ? 'Fait' : 'Modifier',
              style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                color: AppTheme.primaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        SizedBox(width: 2.w),
      ],
    );
  }

  Widget _buildBody()
  {

    return Column(
      children: [
        _buildSearchAndSort(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            color: AppTheme.primaryBlue,
            child: _buildPropertyList(),
          ),
        ),
        if (_isEditMode && _selectedProperties.isNotEmpty)
          _buildEditModeActions(),
      ],
    );
  }

  Widget _buildSearchAndSort() {
    return Column(
      children: [
        FavorisSearchBar(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          onClear: () {
            setState(() {
              _searchQuery = '';
            });
          },
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              Text(
                '${_filteredProperties.length} ${_filteredProperties.length == 1 ? 'hebergement' : 'hebergements'}',
                style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyList() {
    final properties = _filteredProperties;

    if (properties.isEmpty && _searchQuery.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconWidget(
              iconName: 'search_off',
              color: AppTheme.textSecondary,
              size: 15.w,
            ),
            SizedBox(height: 2.h),
            Text(
              'Aucun resultat',
              style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
            SizedBox(height: 1.h),

          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final property = properties[index];
        final propertyId = property['id'] as int;

        return FavorisHebergementCard(
          property: property,
          onTap: () => _navigateToPropertyDetail(property),
          onRemove: () => _removeProperty(propertyId),
          isEditMode: _isEditMode,
          isSelected: _selectedProperties.contains(propertyId),
          onSelectionChanged: (isSelected) =>
              _onPropertySelectionChanged(propertyId, isSelected ?? false),
        );
      },
    );
  }

  Widget _buildEditModeActions() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: AppTheme.borderSubtle,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Text(
              '${_selectedProperties.length} selectionné',
              style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: _removeSelectedProperties,
              icon: CustomIconWidget(
                iconName: 'supprimer',
                color: Colors.white,
                size: 16,
              ),
              label: Text('Retirer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
