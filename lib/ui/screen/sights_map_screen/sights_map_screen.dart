import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/add_new_place_button.dart';
import 'package:places/ui/widgets/buttons/circle_button.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_with_route_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'sights_map_wm.dart';

@RoutePage()
class SightsMapScreen extends ElementaryWidget<ISightsMapWidgetModel> {
  const SightsMapScreen({
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
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      padding: EdgeInsets.only(
                        left: 16,
                        top: 16,
                        right: 16,
                        bottom: wm.isShowedActivePlace ? 231.0 : 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleButton(
                            iconData: CustomIcons.refresh,
                            elevation: 4,
                            onTaped: wm.updatePlacesOnMap,
                          ),
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            child: wm.isShowedActivePlace
                                ? SizedBox.shrink()
                                : AddNewPlaceButton(
                                    onPressed: wm.onNewPlaceTaped,
                                    elevation: 4,
                                  ),
                          ),
                          CircleButton(
                            elevation: 4,
                            iconData: CustomIcons.geolocation,
                            onTaped: wm.moveCameraToUserOrRequestPermission,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 215,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 150),
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween(
                            begin: const Offset(0.0, 1.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(animation);
                          return ClipRect(
                            child: SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            ),
                          );
                        },
                        child: wm.isShowedActivePlace
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  right: 16,
                                  left: 16,
                                  bottom: 16,
                                ),
                                child: GestureDetector(
                                  key: ValueKey('s_on_map_${sight!.id}'),
                                  onVerticalDragUpdate: wm.onCardVerticalDrag,
                                  child: SightCardWithRouteButton(
                                    sight,
                                    onRoutePressed: wm.onCreateRoutePressed,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
