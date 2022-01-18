import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_icon_button.dart';

class WantToVisitSightCard extends SightCardBase {
  const WantToVisitSightCard(Sight sight) : super(sight);

  @override
  Widget aboutVisitInfo(BuildContext context) => Text(
        sight.planToVisitDate != null
            ? '${AppStrings.planToVisit} ${DateFormat(dateFormatStr, 'ru').format(sight.planToVisitDate!)}'
            : '',
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .apply(color: Theme.of(context).colorScheme.secondary),
      );

  @override
  Widget get topRightIcons => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SightCardIconButton(
            icon: CustomIcons.calendar,
            iconSize: topIconSize,
            iconColor: topIconColor,
            onPressed: () => print('Calendar of ${sight.name} is pressed'),
          ),
          SizedBox(
            width: 20,
          ),
          SightCardIconButton(
            icon: CustomIcons.close,
            iconSize: topIconSize,
            iconColor: topIconColor,
            onPressed: () => print('Close of ${sight.name} is pressed'),
          ),
        ],
      );
}
