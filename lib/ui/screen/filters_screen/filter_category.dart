import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';

class FilterCategory extends StatelessWidget {
  const FilterCategory({
    required this.type,
  });

  final SightType type;

  final double _mainContainerSize = 64;
  final double _activeContainerSize = 16;
  final double _iconSize = 30;

  @override
  Widget build(BuildContext context) {
    var parentScreen = context.findAncestorStateOfType<FiltersScreenState>()!;
    final bool isActiveCategory = parentScreen.isActiveCategory(type);
    final double horizontalMargin = MediaQuery.of(context).size.width < 350 ? 12 : 22;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            parentScreen.changeActiveCategory(type);
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
                isActiveCategory
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
