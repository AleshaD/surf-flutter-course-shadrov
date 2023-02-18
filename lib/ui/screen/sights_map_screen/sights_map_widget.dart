import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/widgets/search_bar.dart';
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
        ],
      ),
    );
  }
}
