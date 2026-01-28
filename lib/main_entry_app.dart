import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing/routes/app_routes.dart';
import 'package:ride_sharing/routes/app_routes_file.dart';
import 'package:ride_sharing/screens/error_screen/error_screen.dart';
import 'package:ride_sharing/utils/app_theme.dart';

GlobalKey<NavigatorState>? appNavigatorStateKey = GlobalKey<NavigatorState>();

class MainEntryApp extends StatelessWidget {
  const MainEntryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
      initialRoute: AppRoutes.instance.initial,
      getPages: appRootRoutesFile,
      theme: appThemeData,
      themeMode: ThemeMode.light,
      enableLog: true,
      defaultGlobalState: true,
      transitionDuration: const Duration(microseconds: 100),
      navigatorKey: appNavigatorStateKey,
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return const ErrorScreen();
        };
        if (child != null) {
          return child;
        }
        return const SizedBox();
      },
    );
  }
}
