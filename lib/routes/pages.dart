import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/global/global_function.dart';
import 'package:hotel_booking/features/hebergement/view/hebbergement_view.dart';
import 'package:hotel_booking/features/home/screen/home_view.dart';
import 'package:hotel_booking/features/profiles/view/profile_screen.dart';

import 'package:hotel_booking/navigation_screen.dart';

import 'observers.dart';
import 'routes.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<PageEntity> routesProfiles() {
    return [
      PageEntity(path: AppRoutes.favoritesPage, page: Container()),
      PageEntity(path: AppRoutes.privacyPage, page: Container()),
      PageEntity(path: AppRoutes.historyTransactionPage, page: Container()),
      PageEntity(path: AppRoutes.generalSettings, page: SettingPage()),
    ];
  }

  static List<PageEntity> routesHome() {
    return [
      PageEntity(path: AppRoutes.home, page: const CongoBnbHomePage()),
      PageEntity(path: AppRoutes.hebergement, page: const HebergementView()),
      // PageEntity(
      //   path: AppRoutes.populaireService,
      //   page: const PopulaireService(),
      // ),
      // PageEntity(
      //   path: AppRoutes.populaireFreelance,
      //   page: const PopulaireFreelance(),
      // ),
    ];
  }

  static List<PageEntity> routes() {
    return [
      PageEntity(path: AppRoutes.initial, page: const NavigationScreen()),
      PageEntity(path: AppRoutes.signIn, page: Container()),
      PageEntity(path: AppRoutes.register, page: Container()),
      PageEntity(path: AppRoutes.onBoardingScreen, page: Container()),
      // PageEntity(
      //   path: AppRoutes.succesScreenPayement,
      //   page: const SuccesScreenPayement(),
      // ),
    ];
  }

  static MaterialPageRoute generateRoutesHome(RouteSettings settings) {
    if (settings.name != null) {
      var result = routesHome().where(
        (element) => element.path == settings.name,
      );
      if (result.isNotEmpty) {
        return MaterialPageRoute<void>(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }

    return MaterialPageRoute<void>(
      builder: (_) => CongoBnbHomePage(),
      settings: settings,
    );
  }
  // // routes home

  static MaterialPageRoute generateRouteSettingsProfile(
    RouteSettings settings,
  ) {
    if (settings.name != null) {
      var result = routesProfiles().where(
        (element) => element.path == settings.name,
      );
      if (result.isNotEmpty) {
        return MaterialPageRoute<void>(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }

    return MaterialPageRoute<void>(
      builder: (_) => SettingPage(),
      settings: settings,
    );
  }

  // home generate routres

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        // first open App
        bool deviceFirstOpen = !Global.hiveService.getDeviceFirstOpen();
        if (result.first.path == AppRoutes.initial && deviceFirstOpen) {
          bool isLogin = Global.hiveService.getIsLogin();
          // UserModel user = Global.hiveService.getUserProfile();

          // Vérification de l'état de connexion
          if (!isLogin) {
            return MaterialPageRoute<void>(
              builder: (_) => NavigationScreen(),
              settings: settings,
            );
          }
          return MaterialPageRoute<void>(
            builder: (_) => NavigationScreen(),
            settings: settings,
          );
        }
        return MaterialPageRoute<void>(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute<void>(
      builder: (_) => NavigationScreen(),
      settings: settings,
    );
  }
}

class PageEntity<T> {
  String path;
  Widget page;

  PageEntity({required this.path, required this.page});
}
