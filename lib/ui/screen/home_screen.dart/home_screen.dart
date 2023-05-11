import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/router/app_router.dart';
import 'package:places/ui/styles/custom_icons.dart';

enum HomeScreenTypes {
  mainSightList,
  sightsMap,
  visited,
  settings,
}

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  BottomNavigationBarItem _navigationBarItem({
    required IconData icon,
    required IconData activeIcon,
  }) {
    final double iconSize = 18;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: iconSize,
      ),
      activeIcon: Icon(
        activeIcon,
        size: iconSize,
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      transitionBuilder: (_, child, __) => child,
      routes: [
        SightListRoute(),
        SightsMapRoute(),
        VisitingRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          onTap: tabsRouter.setActiveIndex,
          currentIndex: tabsRouter.activeIndex,
          items: [
            _navigationBarItem(
              icon: CustomIcons.menu_list,
              activeIcon: CustomIcons.menu_list_full,
            ),
            _navigationBarItem(
              icon: CustomIcons.menu_map,
              activeIcon: CustomIcons.menu_map_full,
            ),
            _navigationBarItem(
              icon: CustomIcons.menu_heart,
              activeIcon: CustomIcons.menu_heart_full,
            ),
            _navigationBarItem(
              icon: CustomIcons.menu_settings,
              activeIcon: CustomIcons.menu_settings_fill,
            ),
          ],
        );
      },
    );
  }
}
