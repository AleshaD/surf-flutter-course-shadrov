import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/visiting_screen/empty_list_page.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';
import 'package:places/ui/widgets/sight_cards/want_to_visit_sight_card.dart';

class WantToVisitPage extends StatelessWidget {
  const WantToVisitPage(this.sights);

  final List<Sight> sights;

  @override
  Widget build(BuildContext context) {
    return sights.isEmpty
        ? EmptyListPage(
            icon: CustomIcons.card,
            bodyMessage: AppStrings.emptyWnatToGoList,
          )
        : ListView(
            children: sights
                .map(
                  (sight) => WantToVisitSightCard(
                    key: ValueKey(sight.id),
                    sight: sight,
                    onClosePressed: () => context
                        .findAncestorStateOfType<VisitingScreenState>()!
                        .changeWantToVisitFlag(sight.id),
                  ),
                )
                .toList(),
          );
  }
}
