import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/visit_screen_tab_bar.dart';
import 'package:places/ui/screen/visiting_screen/visited_page.dart';
import 'package:places/ui/screen/visiting_screen/want_to_visit_page.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen();

  @override
  State<VisitingScreen> createState() => VisitingScreenState();
}

class VisitingScreenState extends State<VisitingScreen> {
  void changeWantToVisitFlag(String sightId) {
    setState(() {
      int? index = getIndexBySightId(sightMocks, sightId);
      if (index != null) sightMocks[index].wantToVisit = !sightMocks[index].wantToVisit;
    });
  }

  void changeVisitedFlag(String sightId) {
    setState(() {
      int? index = getIndexBySightId(sightMocks, sightId);
      if (index != null) sightMocks[index].visited = !sightMocks[index].visited;
    });
  }

  int? getIndexBySightId(List<Sight> sights, String id) {
    for (var i = 0; i < sights.length; i++) if (sights[i].id == id) return i;
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: TabBarView(
            children: [
              WantToVisitPage(
                sightMocks.where((sight) => sight.wantToVisit).toList(),
              ),
              VisitedPage(
                sightMocks.where((sight) => sight.visited).toList(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}
