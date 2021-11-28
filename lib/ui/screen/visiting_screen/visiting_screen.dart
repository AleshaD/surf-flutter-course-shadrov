import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/visit_screen_tab_bar.dart';
import 'package:places/ui/screen/visiting_screen/want_to_visit_page.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              title: Center(
                  child: Text(AppStrings.favorites,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black))),
              bottom: VisitScreenTabBar()),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: TabBarView(children: [
              WantToVisitPage(
                  sightMocks.where((element) => element.planToVisitDate != null).toList()),
              Center(child: Text('Second')),
            ]),
          )),
    );
  }
}
