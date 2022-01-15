import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/network_image_with_progress.dart';

class SightCardBase extends StatelessWidget {
  const SightCardBase(this.sight);

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
    return Column(children: [
      Container(
        height: 96,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(cornerRadius),
                  topRight: Radius.circular(cornerRadius),
                ),
                child: NetworkImageWithProgress(sight.url),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  sight.type,
                  style: Theme.of(context).textTheme.subtitle1!.apply(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 18, top: 12),
                child: topRightIcons,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(cornerRadius),
            bottomRight: Radius.circular(cornerRadius),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    sight.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
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
              '${AppStrings.closeUntil} 09:00',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      )
    ]);
  }
}
