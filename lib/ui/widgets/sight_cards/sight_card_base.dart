import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';
import 'package:places/ui/widgets/network_image_with_progress.dart';

class SightCardBase extends StatelessWidget {
  const SightCardBase(this.sight, {Key? key}) : super(key: key);

  final double cardAspectRatio = 3 / 2;
  final double cornerRadius = 12;
  final String dateFormatStr = 'dd MMM yyyy';
  final Sight sight;
  final Color topIconColor = Colors.white;
  final double topIconSize = 22;
  final Widget topRightIcons = const Text('');

  Widget aboutVisitInfo(BuildContext context) => const Text('');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 96,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(cornerRadius),
                  topRight: Radius.circular(cornerRadius),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cornerRadius),
                        topRight: Radius.circular(cornerRadius),
                      ),
                      child: sight.urls.isNotEmpty
                          ? NetworkImageWithProgress(sight.urls[0])
                          : Container(
                              color: Colors.amber,
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        sight.typeName.toLowerCase(),
                        style: Theme.of(context).textTheme.subtitle1!.apply(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(cornerRadius),
                  bottomRight: Radius.circular(cornerRadius),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sight.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: aboutVisitInfo(context),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${AppStrings.closeUntil.toLowerCase()} 09:00',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(cornerRadius),
              ),
              onTap: () => SightDetailsScreen.showInBottomSheet(sight, context),
            ),
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: topRightIcons,
            ),
          ),
        ),
      ],
    );
  }
}
