import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';

class VisitedSightCard extends SightCardBase {
  const VisitedSightCard(Sight sight) : super(sight);

  @override
  Widget get aboutVisitInfo => Text(
        sight.visitedDate != null
            ? '${AppStrings.goalIsAchieved} ${DateFormat(dateFormatStr, 'ru').format(sight.visitedDate!)}'
            : '',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondary),
      );

  @override
  Widget get topRightIcons => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.share,
            size: topIconSize,
            color: topIconColor,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.close, size: topIconSize, color: topIconColor)
        ],
      );
}
