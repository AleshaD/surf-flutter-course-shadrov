import 'package:flutter/material.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/visiting_screen/widgets/draggable_sight_cards_list_view.dart';
import 'package:places/ui/screen/visiting_screen/widgets/empty_list_page.dart';
import 'package:places/ui/widgets/sight_cards/want_to_visit_sight_card.dart';
import 'package:provider/provider.dart';

class WantToVisitPage extends StatelessWidget {
  WantToVisitPage(this.sights);

  final List<SightWantToVisit> sights;

  @override
  Widget build(BuildContext context) {
    return sights.isEmpty
        ? EmptyListPage(
            icon: CustomIcons.card,
            bodyMessage: AppStrings.emptyWnatToGoList,
          )
        : DraggableSightCardsListView<WantToVisitSightCard>(
            sights,
            onReplaceCard: (fromIndex, toIndex) {
              context.read<VisitingBloc>().add(
                    VisitingEvent.changeWantToVisitCardsSequences(fromIndex: fromIndex, toIndex: toIndex),
                  );
            },
          );
  }
}
