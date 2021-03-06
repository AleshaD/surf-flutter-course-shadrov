import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/visit_screen_tab_bar.dart';
import 'package:places/ui/screen/visiting_screen/visited_page.dart';
import 'package:places/ui/screen/visiting_screen/want_to_visit_page.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen();

  @override
  State<VisitingScreen> createState() => VisitingScreenState();
}

class VisitingScreenState extends State<VisitingScreen> {
  void removeFromWantToVisitList(String sightId) {
    setState(() {
      int? index = getIndexBySightId(mockWantToVisitSights, sightId);
      if (index != null) mockWantToVisitSights.removeAt(index);
    });
  }

  void changeWantToVisitCardsSequences(int fromIndex, int toIndex) {
    setState(() {
      _changeCardSequences(mockWantToVisitSights, fromIndex, toIndex);
    });
  }

  void changeVisitedCardsSequences(int fromIndex, int toIndex) {
    setState(() {
      _changeCardSequences(mockVisitedSights, fromIndex, toIndex);
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

  void removeFromVisitedList(String sightId) {
    setState(() {
      int? index = getIndexBySightId(mockVisitedSights, sightId);
      if (index != null) mockVisitedSights.removeAt(index);
    });
  }

  int? getIndexBySightId(List<Sight> sights, String id) {
    for (var i = 0; i < sights.length; i++) if (sights[i].id == id) return i;

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
                mockWantToVisitSights,
              ),
              VisitedPage(
                mockVisitedSights,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
