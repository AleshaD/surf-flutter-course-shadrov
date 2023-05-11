import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/searched_sights_list_view.dart';

import '../../../data/model/sights/sight.dart';

@RoutePage()
class SearchedSightsScreen extends StatelessWidget {
  const SearchedSightsScreen({
    Key? key,
    required this.sights,
  }) : super(key: key);
  final List<Sight> sights;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.searchedSights),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: SearchedSightsListView(
          sights.map((s) => SearchedSight(s, '')).toList(),
        ),
      ),
    );
  }
}
