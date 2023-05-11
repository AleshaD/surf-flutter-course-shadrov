import 'package:flutter/material.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/ui/styles/custom_icons.dart';

class FilterCategory extends StatelessWidget {
  const FilterCategory({
    required this.type,
    required this.isActive,
    required this.onTap,
  });

  final SightType type;
  final bool isActive;
  final ValueChanged<SightType> onTap;

  final double _mainContainerSize = 64;
  final double _activeContainerSize = 16;
  final double _iconSize = 30;

  @override
  Widget build(BuildContext context) {
    final double horizontalMargin = MediaQuery.of(context).size.width < 350 ? 12 : 22;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            onTap(this.type);
          },
          child: Container(
            height: _mainContainerSize,
            width: _mainContainerSize,
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary.withAlpha(24),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Sight.getTypeIconBy(type),
                    size: _iconSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                isActive
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: _activeContainerSize,
                          width: _activeContainerSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Center(
                            child: Icon(
                              CustomIcons.tick,
                              size: 14,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Center(
          child: Text(
            Sight.getTypeNameBy(type),
            style: Theme.of(context).textTheme.bodyText2,
          ),
        )
      ],
    );
  }
}
