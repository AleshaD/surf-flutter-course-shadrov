import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/add_new_place_button.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:places/ui/widgets/sight_cards/sight_card.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'sights_map_wm.dart';

class SightsMapWidget extends ElementaryWidget<ISightsMapWidgetModel> {
  const SightsMapWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultSightsMapWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISightsMapWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.map, style: wm.theme.textTheme.headline5),
        bottom: PreferredSize(
          preferredSize: Size(wm.screenWidth, 50),
          child: Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: SearchBar(
              readOnly: true,
              showFilterBtn: true,
              onFieldTap: wm.onSearchFieldTaped,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          EntityStateNotifierBuilder<List<MapObject>>(
            listenableEntityState: wm.mapObjectsNotifier,
            builder: (_, mapObjects) {
              return YandexMap(
                key: wm.yaMapKey,
                onMapCreated: wm.onMapCreated,
                logoAlignment: MapAlignment(
                  horizontal: HorizontalAlignment.right,
                  vertical: VerticalAlignment.top,
                ),
                nightModeEnabled: wm.isDarkTheme,
                mapObjects: mapObjects!,
              );
            },
          ),
          StateNotifierBuilder<Sight?>(
            listenableState: wm.activeSightState,
            builder: (_, sight) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _CircleButton(
                            iconData: CustomIcons.refresh,
                            elevation: 4,
                            onTaped: wm.updatePlacesOnMap,
                          ),
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 900),
                            child: wm.isShowedActivePlace
                                ? SizedBox.shrink()
                                : AddNewPlaceButton(
                                    onPressed: wm.onNewPlaceTaped,
                                    elevation: 4,
                                  ),
                          ),
                          _CircleButton(
                            elevation: 4,
                            iconData: CustomIcons.geolocation,
                            onTaped: wm.moveCameraToUserOrRequestPermission,
                          ),
                        ],
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: wm.isShowedActivePlace
                          ? Padding(
                              key: ValueKey(sight!.id),
                              padding: const EdgeInsets.only(
                                right: 16,
                                left: 16,
                                bottom: 16,
                              ),
                              child: GestureDetector(
                                onVerticalDragUpdate: wm.onCardVerticalDrag,
                                child: SightCard(sight),
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    Key? key,
    required this.onTaped,
    required this.iconData,
    this.elevation = 0,
  }) : super(key: key);

  final VoidCallback onTaped;
  final IconData iconData;
  final double elevation;
  final double radius = 24.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
            shape: MaterialStatePropertyAll(CircleBorder()),
            elevation: MaterialStatePropertyAll(elevation),
          ),
      child: Icon(
        iconData,
        size: radius,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: onTaped,
    );
  }
}
