import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/network_image_with_progress.dart';

class SightCardTile extends StatelessWidget {
  const SightCardTile({
    required this.sight,
    required this.showDevider,
    required this.onTap,
  });

  final Sight sight;
  final bool showDevider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: sight.url != ''
                  ? NetworkImageWithProgress(sight.url)
                  : Container(
                      color: Colors.amber,
                    ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: InkWell(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Text(sight.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          )),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    sight.typeName,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  showDevider ? Divider() : Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
