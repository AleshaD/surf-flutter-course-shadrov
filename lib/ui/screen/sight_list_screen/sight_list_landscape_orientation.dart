import 'package:flutter/material.dart';

import '../../../data/model/place.dart';
import '../../widgets/sight_cards/sight_card.dart';

class SightListLandscapeOrientation extends StatelessWidget {
  const SightListLandscapeOrientation(this.sights);

  final List<Place> sights;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          double bottomPadding = 0;
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.6,
      ),
    );
  }
}
