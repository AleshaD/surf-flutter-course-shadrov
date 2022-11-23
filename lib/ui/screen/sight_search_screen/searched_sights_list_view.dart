import 'package:flutter/material.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_card_tile.dart';

class SearchedSightsListView extends StatelessWidget {
  const SearchedSightsListView(this.searshedSights);
  final List<SearchedSight> searshedSights;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searshedSights.length,
      itemBuilder: (context, index) {
        final isFirstItem = index == 0;
        final double topPadding = isFirstItem ? 8 : 0;

        return Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: SightCardTile(
            searched: searshedSights[index],
            highliteStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
            normalStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
            showDevider: index != searshedSights.length - 1,
            onTap: () {
              SightDetailsScreen.showInBottomSheet(
                searshedSights[index].sight,
                context,
              );
            },
          ),
        );
      },
    );
  }
}
