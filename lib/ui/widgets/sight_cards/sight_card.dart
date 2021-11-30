import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';

class SightCard extends SightCardBase {
  SightCard(Sight sight) : super(sight);

  @override
  Widget get topRightIcons => Icon(
        Icons.favorite_border_outlined,
        size: topIconSize,
        color: topIconColor,
      );
}
