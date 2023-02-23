import 'package:flutter/material.dart';
import 'package:places/ui/screen/settings_screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen_widget.dart';
import 'package:places/ui/screen/sights_map_screen/sights_map_widget.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen_widget.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';

enum HomeScreenTypes {
  mainSightList,
  sightsMap,
  visited,
  settings,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  static _HomeScreenState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HomeScreenState>();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenTypes currentScreenType = HomeScreenTypes.mainSightList;
  final mapKey = GlobalKey();

  void changeCurrentPageTo(HomeScreenTypes type) {
    setState(() {
      currentScreenType = type;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = SizedBox.shrink();
    switch (currentScreenType) {
      case HomeScreenTypes.mainSightList:
        currentScreen = SightListScreenWidget();
        break;
      case HomeScreenTypes.sightsMap:
        currentScreen = SightsMapWidget(
          key: mapKey,
        );
        break;
      case HomeScreenTypes.visited:
        currentScreen = VisitingScreenWidget();
        break;
      case HomeScreenTypes.settings:
        currentScreen = SettingsScreen();
        break;
      default:
    }

    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(
        currentPage: currentScreenType,
      ),
      body: currentScreen,
    );
  }
}
