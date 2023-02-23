import 'package:flutter/material.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/sight_cards/sight_card.dart';

class SightCardWithRouteButton extends SightCard {
  SightCardWithRouteButton(
    Sight sight, {
    required this.onRoutePressed,
  }) : super(sight);

  final VoidCallback onRoutePressed;

  @override
  double get paddingRightForBottomRightWidget => 64;

  @override
  Widget botomRightWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: onRoutePressed,
      child: Icon(CustomIcons.go),
    );
  }
}
