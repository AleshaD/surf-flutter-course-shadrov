import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/util/location_helper.dart';

part 'sight_filter.g.dart';

@JsonSerializable()
class SightFilter with LocationHelper {
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
          SightType.other,
        };

  static double maxUntilDist = 10000;
  static double minFromDist = 0;

  /// максимально возможное расстояние для фильтра
  double get maxDist => maxUntilDist;

  /// минимально возможное расстояние для фильтра
  double get minDist => minFromDist;

  /// типы мест которые входят в поиск
  final Set<SightType> activeTypes;

  /// есть ли этот тип места в фильтре
  bool isActiveTypes(SightType type) => activeTypes.contains(type);

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
    final distance = getDistanceBeatwenCoordinates(
      Coordinate(lat: sight.lat, lng: sight.lng),
      myCoordinate,
    );

    return _fromDist <= distance && _toDist >= distance;
  }

  bool isSightInType(Sight sight) {
    return activeTypes.contains(sight.sightType);
  }

  factory SightFilter.fromJson(Map<String, dynamic> json) => _$SightFilterFromJson(json);
  Map<String, dynamic> toJson() => _$SightFilterToJson(this);

  @override
  bool operator ==(Object other) => false;
}
