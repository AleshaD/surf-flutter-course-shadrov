import 'package:flutter/material.dart';

import '../../../data/model/place.dart';
import '../../widgets/sight_cards/sight_card.dart';

class SightListPortrateOrientation extends StatelessWidget {
  const SightListPortrateOrientation(this.sights);

  final List<Place> sights;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          double bottomPadding = 0;
          bool isLastElement = index == sights.length - 1;
          if (isLastElement) bottomPadding = 80;

          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
              bottom: bottomPadding,
            ),
            child: SightCard(
              sights[index],
            ),
          );
        },
        childCount: sights.length,
      ),
    );
  }
}
