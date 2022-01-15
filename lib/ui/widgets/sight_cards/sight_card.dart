import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';

class SightCard extends SightCardBase {
  SightCard(Sight sight) : super(sight);

  @override
  Widget get topRightIcons => Icon(
        CustomIcons.menu_heart,
        size: topIconSize,
        color: topIconColor,
      );
}
