import 'package:flutter/material.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screen/sights_map_screen/sights_map_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  static _HomeScreenState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HomeScreenState>();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreen = 0;

  final List<Widget> _homeScreens = [
    const SightListScreen(),
    const SightsMapScreen(),
    const VisitingScreen(),
    const SettingsScreen(),
  ];

  void changeCurrentPageTo(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(
        currentPage: currentScreen,
      ),
      body: _homeScreens[currentScreen],
    );
  }
}
