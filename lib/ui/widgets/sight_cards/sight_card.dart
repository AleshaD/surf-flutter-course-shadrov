import 'package:flutter/material.dart';
import 'package:places/data/model/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_icon_button.dart';

class SightCard extends SightCardBase {
  SightCard(Sight sight) : super(sight);

  @override
  Widget get topRightIcons => SightCardIconButton(
        icon: CustomIcons.menu_heart,
        iconSize: topIconSize,
        iconColor: topIconColor,
        onPressed: (context) => print('Heart of ${sight.name} is pressed'),
      );
}
