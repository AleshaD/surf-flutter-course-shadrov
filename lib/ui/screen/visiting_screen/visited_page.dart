import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/visiting_screen/empty_list_page.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';
import 'package:places/ui/widgets/sight_cards/visited_sight_card.dart';

class VisitedPage extends StatelessWidget {
  const VisitedPage(this.sights);

  final List<Sight> sights;

  @override
  Widget build(BuildContext context) {
    return sights.isEmpty
        ? EmptyListPage(
            icon: CustomIcons.go,
            bodyMessage: AppStrings.emptyVisitedList,
          )
        : ListView(
            children: sights
                .map(
                  (sight) => VisitedSightCard(
                    sight: sight,
                    key: ValueKey(sight.id),
                    onClosePressed: () => context
                        .findAncestorStateOfType<VisitingScreenState>()!
                        .changeVisitedFlag(sight.id),
                  ),
                )
                .toList(),
          );
  }
}
