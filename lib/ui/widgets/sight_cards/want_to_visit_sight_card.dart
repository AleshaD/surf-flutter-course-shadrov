import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';

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
          Icon(
            Icons.calendar_view_month_outlined,
            size: topIconSize,
            color: topIconColor,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.close,
            size: topIconSize,
            color: topIconColor,
          )
        ],
      );
}
