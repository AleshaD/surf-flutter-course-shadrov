import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:yandex_mapkit/yandex_mapkit.dart';

/// Миксин с методами для:
/// - создания картинок для яндекс карт
/// - определения одного стиля карты
/// - перемещения камеры
mixin YandexMapHelper {
  List<MapObject> _userPlaceMarks = [];
  final double userMarkDefaultSize = 80;
  final mskPoint = Point(
    latitude: 55.7,
    longitude: 37.61,
  );

  Future<Uint8List> rawPlacemarkImage(
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

  Future<List<MapObject>> userPlacemark({
    Position? position,
    double? size,
    required ThemeData theme,
  }) async {
    if (position == null) return [];
    if (_userPlaceMarks.isNotEmpty) return [..._userPlaceMarks];
    size ??= userMarkDefaultSize;

    final paint = Paint()
      ..shader = ui.Gradient.linear(Offset(0, 0), Offset(size, size), [
        theme.colorScheme.secondaryContainer,
        theme.colorScheme.secondary,
      ]);
    final userPlaceMark = await rawPlacemarkImage(
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

    return [..._userPlaceMarks];
  }

  List<MapObject> chossenPointPlaceMark(Point? point) {
    if (point == null) return [];
    return [
      PlacemarkMapObject(
        mapId: MapObjectId('chossen_point'),
        point: point,
        opacity: 1,
        icon: PlacemarkIcon.composite([
          PlacemarkCompositeIconItem(
            style: PlacemarkIconStyle(
              zIndex: 2,
              image: BitmapDescriptor.fromAssetImage('assets/images/map/plus.png'),
            ),
            name: 'chossen_point',
          )
        ]),
      ),
    ];
  }

  void moveCameraTo(YandexMapController? yandexMapCtrl, Point point,
      {double? zoom, double durationInSec = 1}) {
    if (yandexMapCtrl != null) {
      final cP = zoom != null
          ? CameraPosition(
              target: point,
              zoom: zoom,
            )
          : CameraPosition(
              target: point,
            );

      yandexMapCtrl.moveCamera(
        CameraUpdate.newCameraPosition(cP),
        animation: MapAnimation(duration: durationInSec),
      );
    }
  }

  /// Серый стиль карты
  String mapStyle() {
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
