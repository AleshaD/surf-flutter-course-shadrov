import 'dart:convert';
import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/repository/location_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen_widget.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'sights_map_model.dart';
import 'sights_map_widget.dart';

abstract class ISightsMapWidgetModel extends IWidgetModel {
  /// Тема приложения
  ThemeData get theme;

  /// Чтобы затемнить при необходимости карту при построении
  bool get isDarkTheme;

  /// Размер экрана для bottom appBar, завязан на didChangeDependencies
  double get screenWidth;

  /// Ключ карты чтобы не перестраивать виджет при обновлении объектов на карте
  GlobalKey get yaMapKey;

  /// Оповестить карту чтобы обновила объекты
  EntityStateNotifier<List<MapObject>> get mapObjectsNotifier;

  /// Завершение построения карты.
  /// По этому коллбэку формируем стиль карты и добавляем объекты на карту
  void onMapCreated(YandexMapController controller);

  /// нажатие на поиск в appBar
  void onSearchFieldTaped();
}

SightsMapWidgetModel defaultSightsMapWidgetModelFactory(BuildContext context) {
  return SightsMapWidgetModel(
    SightsMapModel(
      context.read<DefaultErrorHandler>(),
      context.read<LocationRepository>(),
      context.read<SightRepository>(),
    ),
  );
}

class SightsMapWidgetModel extends WidgetModel<SightsMapWidget, SightsMapModel>
    implements ISightsMapWidgetModel {
  SightsMapWidgetModel(SightsMapModel model) : super(model);

  double _screenWidth = 0;

  /// Опопвещение view чтобы изменить отобаражемые места на карте
  final _mapObjectsNotifier =
      EntityStateNotifier<List<MapObject>>(EntityState.content([]));

  /// Ключ для виджета яндекс карт, чтобы не перестраивать карту при изменении
  /// объектов на карте
  final _yaMapKey = GlobalKey();

  /// Активное место на карте
  MapObject? _activePlacemark;

  /// Отображаемые места на карте
  List<Sight> _sightsOnMap = [];

  /// Переменные чтобы при каждом перестроении карты не создавать
  /// картинки для объектов
  Uint8List? _sightImageBytes;
  Uint8List? _activeSightImageBytes;
  List<MapObject> _userPlaceMarks = [];

  @override
  ThemeData get theme => Theme.of(context);

  @override
  GlobalKey<State<StatefulWidget>> get yaMapKey => _yaMapKey;

  @override
  bool get isDarkTheme => AppState.of(context)!.isDarkTheme;

  @override
  double get screenWidth => _screenWidth;

  @override
  EntityStateNotifier<List<MapObject>> get mapObjectsNotifier => _mapObjectsNotifier;

  @override
  void onMapCreated(YandexMapController mapCtrl) async {
    final userCoordinate = await model.getUserCoordinate();
    mapCtrl
      ..setMapStyle(_mapStyle())
      ..moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: userCoordinate?.lat ?? 55.7,
              longitude: userCoordinate?.lng ?? 37.61,
            ),
            zoom: userCoordinate != null ? 14 : 8,
          ),
        ),
        animation: MapAnimation(duration: 1),
      );
    _updatePlaceMarks(withLoad: true);
  }

  @override
  void onSearchFieldTaped() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SightSearchScreenWidget(),
      ),
    );
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  /// Подсветить выбранную точку на карте.
  /// Или убрать подсвеченную с карты.
  void _onPlacemarkTaped(MapObject mapObject, Point point) {
    if (_activePlacemark?.mapId != mapObject.mapId) {
      _activePlacemark = mapObject;
    } else if (_activePlacemark?.mapId == mapObject.mapId) {
      _activePlacemark = null;
    }

    _updatePlaceMarks();
  }

  Future<void> _updatePlaceMarks({bool withLoad = false}) async {
    final userPosition = await model.getUserPosition();
    final userCoordinate = userPosition != null
        ? Coordinate(lat: userPosition.latitude, lng: userPosition.longitude)
        : null;

    /// Загрузить новые места основываясь на координатах пользователя
    /// Если координаты отсутствуют, то получим все места
    if (withLoad) {
      _sightsOnMap = await model.getSights(userCoordinate);
    }

    /// Размер кружка места на карте
    final placeMarkSize = 40.0;

    /// _userPlacemark добавлет в список объектов точку пользователя
    /// с кругом точности определения координат, если userPosition = null, то
    /// возращает пустой список
    final mapObjects = await _userPlacemark(userPosition, placeMarkSize * 2);

    /// Картинка обычного места, закрашенный кружок в соответствии с темой приложеня
    _sightImageBytes ??=
        await _rawPlacemarkImage(placeMarkSize, theme.colorScheme.onBackground);

    /// Картинка активного места на карте
    _activeSightImageBytes ??= await _rawPlacemarkImage(
      placeMarkSize * 2,
      theme.colorScheme.secondary,
    );

    for (var s in _sightsOnMap) {
      var id = MapObjectId('${s.id}');
      final isActive = id == _activePlacemark?.mapId;
      mapObjects.add(
        PlacemarkMapObject(
          mapId: id,
          point: Point(latitude: s.lat, longitude: s.lng),
          opacity: 1,
          icon: PlacemarkIcon.composite(
            [
              PlacemarkCompositeIconItem(
                style: PlacemarkIconStyle(
                  zIndex: isActive ? 2 : 1,
                  image: isActive
                      ? BitmapDescriptor.fromBytes(_activeSightImageBytes!)
                      : BitmapDescriptor.fromBytes(_sightImageBytes!),
                ),
                name: 's_${s.name}',
              ),
            ],
          ),
          onTap: _onPlacemarkTaped,
        ),
      );
    }

    /// Передаём места на view
    _mapObjectsNotifier.content(mapObjects);
  }

  Future<List<MapObject>> _userPlacemark(Position? position, double size) async {
    if (position == null) return [];
    if (_userPlaceMarks.isNotEmpty) return _userPlaceMarks;

    final paint = Paint()
      ..shader = ui.Gradient.linear(Offset(0, 0), Offset(size, size), [
        theme.colorScheme.secondaryContainer,
        theme.colorScheme.secondary,
      ]);
    final userPlaceMark = await _rawPlacemarkImage(
      size,
      Colors.green,
      borderColor: Colors.white,
      customPaint: paint,
    );

    final userPoint = Point(latitude: position.latitude, longitude: position.longitude);

    _userPlaceMarks
      ..add(
        PlacemarkMapObject(
          mapId: MapObjectId('user_point'),
          point: userPoint,
          opacity: 1,
          icon: PlacemarkIcon.composite([
            PlacemarkCompositeIconItem(
              style: PlacemarkIconStyle(
                zIndex: 2,
                image: BitmapDescriptor.fromBytes(userPlaceMark),
              ),
              name: 'user_point',
            )
          ]),
        ),
      )
      ..add(
        CircleMapObject(
          mapId: MapObjectId('user_accuracy'),
          circle: Circle(
            center: userPoint,
            radius: 8,
          ),
          strokeColor: theme.colorScheme.secondary,
          strokeWidth: 1.0,
          fillColor: theme.colorScheme.secondary.withAlpha(80),
          zIndex: 1,
        ),
      );

    return _userPlaceMarks;
  }

  Future<Uint8List> _rawPlacemarkImage(
    double widthAndHeight,
    Color fillColor, {
    Color? borderColor,
    Paint? customPaint,
  }) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size = Size(widthAndHeight, widthAndHeight);
    final fillPaint = customPaint ?? Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    final radius = widthAndHeight / 2 - widthAndHeight / 10;

    final circleOffset = Offset(size.height / 2, size.width / 2);
    canvas.drawCircle(circleOffset, radius, fillPaint);

    if (borderColor != null) {
      final strokePaint = Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6;
      canvas.drawCircle(circleOffset, radius, strokePaint);
    }

    final image =
        await recorder.endRecording().toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  /// Серый стиль карты
  String _mapStyle() {
    final land = [
      {
        "stylers": {
          "saturation": -1,
          "lightness": 0,
        }
      }
    ];
    return json.encode(land);
  }
}
