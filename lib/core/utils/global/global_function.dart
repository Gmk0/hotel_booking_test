import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:hotel_booking/services/storage_service.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class Global {
  static late HiveService hiveService;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // setSystemUi();

    // 🔹 Initialisation de Hive
    await Hive.initFlutter();
    await Hive.openBox('app_storage');

    // 🔹 Initialisation du service Hive
    hiveService = HiveService();
  }

  static TransitionBuilder MaterialAppBuilder({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(
            context,
            Overlay(initialEntries: [
              OverlayEntry(builder: (BuildContext context) {
                return FlutterEasyLoading(key: GlobalKey(), child: child);
              }),
              // OverlayEntry(builder: (BuildContext context) {
              //   return TopSnackbar(key: GlobalKey());
              // })
            ]));
      } else {
        return Overlay(initialEntries: [
          OverlayEntry(builder: (BuildContext context) {
            return FlutterEasyLoading(key: GlobalKey(), child: child);
          }),
          // OverlayEntry(builder: (BuildContext context) {
          //   return TopSnackbar(key: TopSnakbarKey);
          // })
        ]);
      }
    };
  }

  static void setSystemUi() {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
