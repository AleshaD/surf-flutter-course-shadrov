import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:places/data/model/sights/sight.dart';

mixin MapLauncherToSight {
  void showBottomSheetForMapLaunch(
    BuildContext context, {
    required Sight sight,
    VoidCallback? onLaunch,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;
    try {
      final coords = Coords(sight.lat, sight.lng);
      final title = sight.name;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () {
                        if (onLaunch != null) onLaunch();
                        map.showMarker(
                          coords: coords,
                          title: title,
                        );
                        Navigator.of(context).pop();
                      },
                      title: Text(
                        map.mapName,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
