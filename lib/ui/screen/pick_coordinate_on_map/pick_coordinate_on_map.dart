import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/repository/location_repository.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/widgets/buttons/circle_button.dart';
import 'package:places/util/yandex_map_helper.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class PickCoordinateOnMap extends StatefulWidget {
  PickCoordinateOnMap({
    Key? key,
  }) : super(key: key);

  @override
  _PickCoordinateOnMapState createState() => _PickCoordinateOnMapState();
}

class _PickCoordinateOnMapState extends State<PickCoordinateOnMap> with YandexMapHelper {
  YandexMapController? _yaMapCtrl;
  Coordinate? _pickedCoordinate;
  late final LocationRepository _locationRepository;
  final bottomAppBarHeight = 74.0;

  final mapKey = ValueKey('ya_map');
  List<MapObject> _userMark = [];
  List<MapObject> _mapObjects = [];

  @override
  void initState() {
    super.initState();
    _locationRepository = context.read<LocationRepository>();
  }

  void _onMapCreate(YandexMapController mapCtrl) async {
    _yaMapCtrl = mapCtrl..setMapStyle(mapStyle());
    final userPosition = await _locationRepository.getUserPosition();
    final Point mvCameraPoint;
    final double zoom;
    if (userPosition != null) {
      zoom = 13;
      mvCameraPoint = Point(
        latitude: userPosition.latitude,
        longitude: userPosition.longitude,
      );
    } else {
      zoom = 9;
      mvCameraPoint = mskPoint;
    }
    moveCameraTo(_yaMapCtrl, mvCameraPoint, zoom: zoom);
    _updateObjectMarks(withUserUpdate: true);
  }

  void _updateObjectMarks({bool withUserUpdate = false, Point? tapedPoint}) async {
    if (withUserUpdate) _userMark = await _userPlacemarkAfterGetCoordinate();
    final chossenPoint = chossenPointPlaceMark(tapedPoint);

    setState(() {
      _mapObjects = [..._userMark, ...chossenPoint];
    });
  }

  void _tapedOnMap(Point tapedPoint) {
    _pickedCoordinate = Coordinate(lat: tapedPoint.latitude, lng: tapedPoint.longitude);
    _updateObjectMarks(tapedPoint: tapedPoint);
    moveCameraTo(_yaMapCtrl, tapedPoint, durationInSec: 0.15);
  }

  Future<List<MapObject>> _userPlacemarkAfterGetCoordinate() async {
    final userPosition = await _locationRepository.getUserPosition();
    if (userPosition != null)
      return await userPlacemark(position: userPosition, theme: Theme.of(context));
    else
      return [];
  }

  void _onShowUserLocationTaped() async {
    final userPosition = await _locationRepository.getUserPosition(withRequest: true);
    if (userPosition != null) {
      final Point? p = _pickedCoordinate != null
          ? Point(latitude: _pickedCoordinate!.lat, longitude: _pickedCoordinate!.lng)
          : null;
      _updateObjectMarks(withUserUpdate: true, tapedPoint: p);
      moveCameraTo(
        _yaMapCtrl,
        Point(
          latitude: userPosition.latitude,
          longitude: userPosition.longitude,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _pickedCoordinate != null
                ? () => Navigator.of(context).pop(_pickedCoordinate)
                : null,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(AppStrings.ready),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(AppStrings.location),
        leadingWidth: 78,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                AppStrings.cancel,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: bottomAppBarHeight),
            child: YandexMap(
              key: mapKey,
              logoAlignment: MapAlignment(
                horizontal: HorizontalAlignment.right,
                vertical: VerticalAlignment.top,
              ),
              nightModeEnabled: AppState.of(context)!.isDarkTheme,
              mapObjects: _mapObjects,
              onMapCreated: _onMapCreate,
              onMapTap: (p) => _tapedOnMap(p),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: bottomAppBarHeight,
              padding: EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.background.withOpacity(0.8),
              child: Center(
                child: Text(
                  AppStrings.moveMapForChooseCoordinate,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 16),
                child: CircleButton(
                  onTaped: _onShowUserLocationTaped,
                  iconData: CustomIcons.geolocation,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
