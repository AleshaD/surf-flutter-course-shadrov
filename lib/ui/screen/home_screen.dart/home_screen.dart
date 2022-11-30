import 'package:flutter/material.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screen/sights_map_screen/sights_map_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../../data/interactor/sight_interactor.dart';
import '../../../data/model/sights/sight.dart';
import '../../../data/model/sights/sight_filter.dart';

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
  List<Sight> _loadedSights = <Sight>[];

  void changeCurrentPageTo(HomeScreenTypes type) {
    setState(() {
      currentScreenType = type;
    });
  }

  void reloadSights() => _loadSights();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSights();
  }

  Future<void> _loadSights() async {
    final sights = await context.read<SightInteractor>().getSightsFromFilter(SightFilter.dafult());
    if (currentScreenType == HomeScreenTypes.mainSightList)
      setState(() {
        _loadedSights = sights;
      });
    else
      _loadedSights = sights;
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = SizedBox.shrink();
    switch (currentScreenType) {
      case HomeScreenTypes.mainSightList:
        currentScreen = SightListScreen(
          sights: _loadedSights,
        );
        break;
      case HomeScreenTypes.sightsMap:
        currentScreen = SightsMapScreen();
        break;
      case HomeScreenTypes.visited:
        currentScreen = VisitingScreen();
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
