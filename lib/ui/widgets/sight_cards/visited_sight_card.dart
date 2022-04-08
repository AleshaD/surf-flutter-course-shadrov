import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/place.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_dismissible.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_icon_button.dart';

class VisitedSightCard extends SightCardDismissible {
  const VisitedSightCard({
    required Place sight,
    required this.onClosePressed,
    bool showElevation = false,
    Key? key,
  }) : super(sight, onDismissed: onClosePressed, showElevation: showElevation, key: key);

  final VoidCallback onClosePressed;

  @override
  Widget aboutVisitInfo(BuildContext context) => Text(
        sight.visitedDate != null
            ? '${AppStrings.goalIsAchieved} ${DateFormat(dateFormatStr, 'ru').format(sight.visitedDate!)}'
            : '',
        style: Theme.of(context).textTheme.subtitle2,
      );

  @override
  Widget get topRightIcons => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SightCardIconButton(
            icon: CustomIcons.share,
            iconSize: topIconSize,
            iconColor: topIconColor,
            onPressed: (context) => print('Share of ${sight.name} is pressed'),
          ),
          SizedBox(
            width: 20,
          ),
          SightCardIconButton(
            icon: CustomIcons.close,
            iconSize: topIconSize,
            iconColor: topIconColor,
            onPressed: (context) => onClosePressed(),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: super.build(context),
    );
  }
}
