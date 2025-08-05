import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/core/utils/global/global_function.dart';
import 'package:hotel_booking/core/utils/theme/theme.dart';
import 'package:hotel_booking/images.dart';
import 'package:hotel_booking/navigation_screen.dart';
import 'package:hotel_booking/routes/names.dart';
import 'package:hotel_booking/routes/pages.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Global.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ProviderScope(
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MainApp();
          },
        ),
      ),
    ),
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: Global.MaterialAppBuilder(builder: DevicePreview.appBuilder),
      navigatorKey: Global.navigatorKey,
      scaffoldMessengerKey: Global.rootScaffoldMessengerKey,
      title: 'Congo bnb',
      //  themeMode: ThemeMode.light,
      //  theme: AppTheme.lightTheme,
      //  darkTheme: AppTheme.dartTheme,
      navigatorObservers: [AppPages.observer],
      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppPages.generateRouteSettings,
    );
  }
}
