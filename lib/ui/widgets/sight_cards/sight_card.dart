import 'package:flutter/material.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';
import 'package:places/ui/widgets/sight_cards/sight_heart_icon_btn.dart';

class SightCard extends SightCardBase {
  SightCard(Sight sight) : super(sight);

  @override
  Widget get topRightIcons => SightHeartIconBtn(
        iconSize: topIconSize,
        iconColor: topIconColor,
        sight: sight,
      );
}
