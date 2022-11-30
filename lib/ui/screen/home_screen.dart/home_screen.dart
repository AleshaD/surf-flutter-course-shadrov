import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screen/sights_map_screen/sights_map_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';

import '../../../data/interactor/sight_interactor.dart';

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
        currentScreen = SightListScreen();
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

    return BlocProvider(
      lazy: false,
      create: (context) => VisitingBloc(
        sightRepository: context.read<SightInteractor>(),
      )..add(VisitingEvent.loadSights()),
      child: Scaffold(
        bottomNavigationBar: AppBottomNavigationBar(
          currentPage: currentScreenType,
        ),
        body: currentScreen,
      ),
    );
  }
}
