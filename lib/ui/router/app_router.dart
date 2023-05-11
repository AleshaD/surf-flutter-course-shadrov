import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/home_screen.dart/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen_wm.dart';
import 'package:places/ui/screen/settings_screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen_wm.dart';
import 'package:places/ui/screen/sights_map_screen/sights_map_screen.dart';
import 'package:places/ui/screen/sights_map_screen/sights_map_wm.dart';
import 'package:places/ui/screen/splash_screen/splash_screen.dart';
import 'package:places/ui/screen/splash_screen/splash_screen_wm.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen_wm.dart';

part 'app_router.gr.dart';

extension RouterInfoExt on PageRouteInfo {
  String get pathName => '/$routeName';
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  String asPath(String name) => '/$name';

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: asPath(SplashRoute.name),
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
            path: asPath(OnboardingRoute.name), page: OnboardingRoute.page),
        AutoRoute(
          path: asPath(HomeRoute.name),
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: SightListRoute.name,
              page: SightListRoute.page,
              initial: true,
            ),
            AutoRoute(path: SightsMapRoute.name, page: SightsMapRoute.page),
            AutoRoute(path: VisitingRoute.name, page: VisitingRoute.page),
            AutoRoute(path: SettingsRoute.name, page: SettingsRoute.page),
          ],
        ),
      ];
}
