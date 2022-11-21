import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/home_screen.dart/home_screen.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({this.currentPage = HomeScreenTypes.mainSightList});

  final HomeScreenTypes currentPage;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  final double iconSize = 18;

  /** Для изменения радиуса inkWell эффекта, нужно в коде flutter
   * в файле bottom_navigation_bar.dart
   * добавить в виджет result = InkResponse на строке 517 в классе _BottomNavigationTile
   * свойство radius: iconSize,
  */
  BottomNavigationBarItem _navigationBarItem({
    required IconData icon,
    required IconData activeIcon,
  }) {
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
    return BottomNavigationBar(
      onTap: (newPageIndex) {
        final type = HomeScreenTypes.values[newPageIndex];
        HomeScreen.of(context)!.changeCurrentPageTo(type);
      },
      currentIndex: widget.currentPage.index,
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
  }
}
