import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/sight_interactor.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/ui/screen/visiting_screen/visit_screen_tab_bar.dart';
import 'package:places/ui/screen/visiting_screen/visited_page.dart';
import 'package:places/ui/screen/visiting_screen/want_to_visit_page.dart';
import 'package:provider/provider.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen();

  @override
  State<VisitingScreen> createState() => VisitingScreenState();
}

class VisitingScreenState extends State<VisitingScreen> {
  void removeFromWantToVisitList(Sight sight) {
    setState(() {
      context.read<SightInteractor>().removeFromFavorites(sight);
    });
  }

  void changeWantToVisitCardsSequences(int fromIndex, int toIndex) {
    setState(() {
      _changeCardSequences(context.read<SightInteractor>().getFavoriteSights(), fromIndex, toIndex);
    });
  }

  void changeVisitedCardsSequences(int fromIndex, int toIndex) {
    setState(() {
      _changeCardSequences(context.read<SightInteractor>().getVisitedSights(), fromIndex, toIndex);
    });
  }

  void _changeCardSequences(List<Sight> sights, int fromIndex, int toIndex) {
    if (toIndex > fromIndex) toIndex--;
    if (toIndex < 0) toIndex = 0;
    sights.insert(
      toIndex,
      sights.removeAt(fromIndex),
    );
  }

  void removeFromVisitedList(Sight sight) {
    setState(() {
      context.read<SightInteractor>().removeFromVisited(sight);
    });
  }

  int? getIndexBySightId(List<Sight> sights, String id) {
    for (var i = 0; i < sights.length; i++) if (sights[i].idStr == id) return i;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              AppStrings.favorites,
            ),
          ),
          bottom: VisitScreenTabBar(
            tabs: [
              Tab(text: AppStrings.wantToGo),
              Tab(text: AppStrings.visited),
            ],
          ),
        ),
        body: Container(
          // padding: const EdgeInsets.symmetric(vertical: 16),
          child: TabBarView(
            children: [
              WantToVisitPage(
                context.read<SightInteractor>().getFavoriteSights(),
              ),
              VisitedPage(
                context.read<SightInteractor>().getVisitedSights(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
