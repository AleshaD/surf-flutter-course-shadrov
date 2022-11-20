import 'package:flutter/material.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_dismissible.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_imitation.dart';
import 'package:places/ui/widgets/sight_cards/visited_sight_card.dart';
import 'package:places/ui/widgets/sight_cards/want_to_visit_sight_card.dart';

typedef RaplaceCardCallback = void Function(int fromIndex, int toIndex);
typedef RemoveCardCallback = void Function(Sight sigth);

class DraggableSightCardsListView<T extends SightCardDismissible> extends StatelessWidget {
  DraggableSightCardsListView(
    this.sights, {
    required this.removeCard,
    required this.onReplaceCard,
  });

  final List<SightWantToVisit> sights;
  final RemoveCardCallback removeCard;
  final RaplaceCardCallback onReplaceCard;

  Widget dragTarget(int buildIndex) {
    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) => candidateData.isNotEmpty
          ? SightCardImitation(height: 165)
          : Container(
              height: 32,
            ),
      onWillAccept: (moveIndex) {
        final nearCardIndex = buildIndex - 1;

        return moveIndex != buildIndex && moveIndex != nearCardIndex;
      },
      onAccept: (moveIndex) {
        onReplaceCard(moveIndex, buildIndex);
      },
    );
  }

  Widget draggbleChild(SightWantToVisit sight) {
    if (T == WantToVisitSightCard)
      return WantToVisitSightCard(
        sightWantToVisit: sight,
        showElevation: true,
        onClosePressed: () {},
      );
    else if (T == VisitedSightCard)
      return VisitedSightCard(
        sightWantToVisit: sight,
        showElevation: true,
        onClosePressed: () {},
      );
    else
      return Container();
  }

  Widget cardChild(SightWantToVisit sight) {
    if (T == WantToVisitSightCard)
      return WantToVisitSightCard(
        key: ValueKey(sight.idStr),
        sightWantToVisit: sight,
        onClosePressed: () => removeCard(sight),
      );
    else if (T == VisitedSightCard)
      return VisitedSightCard(
        key: ValueKey(sight.idStr),
        sightWantToVisit: sight,
        onClosePressed: () => removeCard(sight),
      );
    else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sights.length,
      itemBuilder: (context, buildIndex) {
        final sight = sights[buildIndex];
        final lastIndex = buildIndex == sights.length - 1;

        return Column(
          children: [
            dragTarget(buildIndex),
            LongPressDraggable<int>(
              data: buildIndex,
              feedback: Container(
                width: MediaQuery.of(context).size.width,
                child: draggbleChild(sight),
              ),
              childWhenDragging: SightCardImitation(
                height: 32,
              ),
              child: cardChild(sight),
            ),
            if (lastIndex) dragTarget(buildIndex + 1),
          ],
        );
      },
    );
  }
}
