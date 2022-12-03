import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/pickers.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_dismissible.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_icon_button.dart';
import 'package:provider/provider.dart';

import '../../../data/model/sights/sight_want_to_visit.dart';

class WantToVisitSightCard extends SightCardDismissible {
  const WantToVisitSightCard({
    required this.sightWantToVisit,
    required this.onClosePressed,
    bool showElevation = false,
    Key? key,
  }) : super(sightWantToVisit, onDismissed: onClosePressed, showElevation: showElevation, key: key);

  final VoidCallback onClosePressed;
  final SightWantToVisit sightWantToVisit;

  void pickVisitDate(BuildContext context) async {
    DateTime? dateTime = await Pickers.pickDateAndTime(context);
    if (dateTime != null) {
      context.read<VisitingBloc>().add(
            VisitingEvent.addWantToVisitTime(
              sight: sight,
              date: dateTime,
            ),
          );
    }
  }

  @override
  Widget aboutVisitInfo(BuildContext context) => Text(
        sightWantToVisit.wantToVisitTime != null
            ? '${AppStrings.planToVisit} ${DateFormat(dateFormatStr, 'ru').format(sightWantToVisit.wantToVisitTime!)}'
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
            onPressed: pickVisitDate,
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
