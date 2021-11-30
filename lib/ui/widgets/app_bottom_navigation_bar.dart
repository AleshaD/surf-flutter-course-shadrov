import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  final Color iconColor = AppColors.main;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined, color: iconColor),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map, color: iconColor),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: iconColor),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: iconColor),
          label: '',
        ),
      ],
    );
  }
}
