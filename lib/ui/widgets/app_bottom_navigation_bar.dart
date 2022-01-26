import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  final double iconSize = 18;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.menu_list,
            size: iconSize,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.map,
            size: iconSize,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.menu_heart_full,
            size: iconSize,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.menu_settings,
            size: iconSize,
          ),
          label: '',
        ),
      ],
    );
  }
}
