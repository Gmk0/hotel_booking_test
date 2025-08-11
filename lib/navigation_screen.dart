import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/features/chats/Chats_feature.dart';
import 'package:hotel_booking/routes/pages.dart';

import 'features/favoris/favourite_screen.dart';
import 'features/profile/ProfileScreen.dart';

class NavigationScreen extends StatefulWidget {
  final int selectedIndex;
  const NavigationScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late int activeTabIndex;
  List barItems = [
    {
      "icon": "assets/icons/search.svg",
      // "page": CongoBnbHomePage(),
      "label": 'explore',
    },
    {"icon": "assets/icons/search.svg", "label": 'Chat'},
    {"icon": "assets/icons/pin-area.svg", "label": 'Favoris'},
    {"icon": "assets/icons/pin-area.svg", "label": 'booking'},
    {"icon": "assets/icons/setting.svg", "label": 'profile'},
  ];

  // Créez la clé ici
  final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();

  // Créez la clé ici
  final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> commandeNavigatorKey =
      GlobalKey<NavigatorState>();

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [];

  //====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    activeTabIndex = widget.selectedIndex;
    _controller.forward();
    _navigatorKeys.addAll([
      homeNavigatorKey, // Onglet Accueil
      GlobalKey<NavigatorState>(), // Onglet Message
      GlobalKey<NavigatorState>(), // Onglet Recherche
      commandeNavigatorKey, // Onglet Commande
      profileNavigatorKey, // Onglet Profile
    ]);
  }

  Future<bool> _systemBackButtonPressed(bool didPop) {
    if (_navigatorKeys[activeTabIndex].currentState?.canPop() == true) {
      _navigatorKeys[activeTabIndex].currentState?.pop(
        _navigatorKeys[activeTabIndex].currentContext,
      );
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
    return Future.value(false);
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    if (activeTabIndex == index) {
      // Vérifie si l'utilisateur est déjà dans l'onglet Profile

      print(_navigatorKeys[index].currentState);

      _navigatorKeys[index].currentState?.popUntil(
        (route) => route.isFirst,
      ); // Revient à la racine
    } else {
      _controller.reset();
      setState(() {
        activeTabIndex = index;
      });
    }

    _controller.forward();
  }
  //====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _systemBackButtonPressed,
      child: Scaffold(
        backgroundColor: CustomColors.scafold,

        body: Stack(
          children: [
            // Contenu de la page active
            Positioned.fill(child: getBarPage()),

            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: getBottomBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBarPage() {
    return IndexedStack(
      index: activeTabIndex,
      children: [
        animatedPage(
          Navigator(
            key: homeNavigatorKey, // Utilisez la clé passée
            onGenerateRoute: AppPages.generateRoutesHome, // Route par défaut
          ),
        ),

        animatedPage(ChatListScreen()), // Chat
        animatedPage(FavouriteScreen()), // Nearby
        animatedPage(Container()), // Book
        animatedPage(
          ProfileScreen()
        ),
      ],
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(124.75),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          barItems.length,
          (index) => Expanded(
            child: Center(
              child: BottomBarItem(
                barItems[index]["icon"],
                label: barItems[index]["label"],
                isActive: activeTabIndex == index,
                activeColor: CustomColors.hotelColor,
                onTap: () => onPageChanged(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
    this.icon, {
    this.onTap,
    this.color = Colors.grey,
    required this.label,
    this.activeColor = CustomColors.primary,
    this.isActive = false,
  });
  final String icon, label;
  final Color color;
  final Color activeColor;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: bottomBarColor,
          boxShadow: [],
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              color: isActive ? CustomColors.darkGreen : color,
              width: 20,
              height: 20,
            ),
            Text(
              label ?? '',
              style: Theme.of(context).textTheme.labelMedium!.apply(
                color: isActive ? CustomColors.darkGreen : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
