import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_dismissble.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_icon_button.dart';

class VisitedSightCard extends SightCardDismissible {
  const VisitedSightCard({
    required Sight sight,
    required this.onClosePressed,
    Key? key,
  }) : super(sight, onDismissed: onClosePressed, key: key);

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
            onPressed: () => print('Share of ${sight.name} is pressed'),
          ),
          SizedBox(
            width: 20,
          ),
          SightCardIconButton(
            icon: CustomIcons.close,
            iconSize: topIconSize,
            iconColor: topIconColor,
            onPressed: onClosePressed,
          ),
          SizedBox(
            width: 12,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: super.build(context),
    );
  }
}
