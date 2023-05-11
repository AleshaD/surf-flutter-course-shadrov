import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_base.dart';

class SightCardDismissible extends SightCardBase {
  const SightCardDismissible(
    Sight sight, {
    required this.onDismissed,
    this.showElevation = false,
    Key? key,
  }) : super(sight, key: key);

  final VoidCallback onDismissed;
  final bool showElevation;

  @override
  Widget aboutVisitInfo(BuildContext context) => SizedBox();

  @override
  Widget get topRightIcons => SizedBox();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              boxShadow: showElevation ? kElevationToShadow[4] : null,
              borderRadius: BorderRadius.all(
                Radius.circular(cornerRadius),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            //если сделать column вместо этой реализации,
            //то при удалении карточки возникает ошибка overflow
            child: Container(
              height: 60,
              width: 120,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      CustomIcons.bucket,
                      size: 28,
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      AppStrings.delete,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.onError,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Dismissible(
          key: ValueKey(sight.idStr),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) => onDismissed(),
          child: super.build(context),
        ),
      ],
    );
  }
}
