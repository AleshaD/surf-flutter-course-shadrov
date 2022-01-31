import 'package:flutter/material.dart';
import 'package:places/domain/searched_sight.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_card_tile.dart';

class SearchedSightsListView extends StatelessWidget {
  const SearchedSightsListView(this.searshedSights);
  final List<SearchedSight> searshedSights;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        for (var i = 0; i < searshedSights.length; i++)
          SightCardTile(
            searched: searshedSights[i],
            highliteStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
            normalStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
            showDevider: i != searshedSights.length - 1,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SightDetailsScreen(searshedSights[i].sight),
              ),
            ),
          )
      ],
    );
  }
}
