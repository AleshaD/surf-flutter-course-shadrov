import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:places/domain/coordinate.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';

class SightFilter {
  SightFilter({
    required fromDist,
    required toDist,
    required this.activeTypes,
  })  : assert(fromDist >= minFromDist),
        assert(toDist <= maxUntilDist),
        this._fromDist = fromDist >= minFromDist ? fromDist : minFromDist,
        this._toDist = toDist <= maxUntilDist ? toDist : maxUntilDist;

  SightFilter.dafult()
      : this._fromDist = 0,
        this._toDist = 10000,
        this.activeTypes = {
          SightType.cafe,
          SightType.hotel,
          SightType.museum,
          SightType.park,
          SightType.restaurant,
          SightType.specialPlace,
        };

  static double maxUntilDist = 10000;
  static double minFromDist = 0;

  /// типы мест которые входят в поиск
  final Set<SightType> activeTypes;

  /// расстояние от которого искать место, в метрах
  double _fromDist;

  /// расстояние до которого искать место, в метрах
  double _toDist;

  double get fromDist => _fromDist;
  set fromDist(double val) {
    _fromDist = val >= minFromDist ? val : minFromDist;
  }

  double get toDist => _toDist;
  set toDist(double val) {
    _toDist = val <= maxUntilDist ? val : maxUntilDist;
  }

  RangeValues get getRange => RangeValues(fromDist, toDist);

  void setByRange(RangeValues range) {
    fromDist = range.start;
    toDist = range.end;
  }

  bool sightInFilter(Sight sight, Coordinate myCoordinate) =>
      isSightInRange(sight, myCoordinate) && isSightInType(sight);

  bool isSightInRange(Sight sight, Coordinate myCoordinate) {
    var ky = 40000 / 360;
    var kx = Math.cos(Math.pi * myCoordinate.lat / 180.0) * ky;
    var dx = (myCoordinate.lon - sight.lon).abs() * kx;
    var dy = (myCoordinate.lat - sight.lat).abs() * ky;
    var distance = Math.sqrt(dx * dx + dy * dy) * 1000;

    return _fromDist <= distance && _toDist >= distance;
  }

  bool isSightInType(Sight sight) {
    return activeTypes.contains(sight.type);
  }
}
