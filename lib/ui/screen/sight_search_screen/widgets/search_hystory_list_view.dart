import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/search_hystory_tile.dart';

import '../../../../constants/app_strings.dart';

class SearchHystoryListView extends StatelessWidget {
  const SearchHystoryListView({
    Key? key,
    required this.hystory,
    required this.tileTaped,
    required this.clearHystoryTaped,
    required this.delHystoryQuery,
  }) : super(key: key);

  final VoidCallback clearHystoryTaped;
  final void Function(String) delHystoryQuery;
  final Set<String> hystory;
  final void Function(String) tileTaped;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 32,
        ),
        Text(
          AppStrings.youSearched.toUpperCase(),
          style: Theme.of(context).textTheme.caption,
        ),
        for (var i = 0; i < hystory.length; i++)
          SearchHystoryTile(
            name: hystory.elementAt(i),
            showDevider: i != hystory.length - 1,
            tileTaped: () {
              String searchTxt = hystory.elementAt(i);
              tileTaped(searchTxt);
            },
            onDelBtnPressed: () => delHystoryQuery(hystory.elementAt(i)),
          ),
        TextButton(
          onPressed: clearHystoryTaped,
          child: Text(
            AppStrings.cleanHystory,
          ),
        ),
      ],
    );
  }
}
