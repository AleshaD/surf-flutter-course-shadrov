import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/styles/custom_icons.dart';

part 'sight.g.dart';

@JsonSerializable()
class Sight {
  Sight({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.sightType,
    required this.description,
    required this.wantToVisit,
    required this.visited,
    required this.liked,
    this.wantToVisitAtDate,
    this.visitedDate,
  });

  Sight.onCreate({
    required this.name,
    required this.lat,
    required this.lng,
    required this.urls,
    required this.description,
    required this.sightType,
  })  : wantToVisit = false,
        visited = false,
        liked = false,
        wantToVisitAtDate = null,
        visitedDate = null,
        id = _idCreator(lat);

  factory Sight.fromJson(Map<String, dynamic> json) => _$SightFromJson(json);

  Map<String, dynamic> toJson() => _$SightToJson(this);

  final String id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  @JsonKey(name: 'placeType')
  final SightType sightType;
  final String description;

  @deprecated
  final DateTime? visitedDate;
  @deprecated
  final DateTime? wantToVisitAtDate;
  @deprecated
  bool wantToVisit;
  @deprecated
  bool visited;
  @deprecated
  bool liked;

  String get typeName => getTypeNameBy(this.sightType);
  IconData get icon => getTypeIconBy(this.sightType);
  Map<String, dynamic> get bodyForUpdate => {
        'lat': this.lat,
        'lng': this.lng,
        'name': this.name,
        'urls': this.urls,
        'placeType': _$SightTypeEnumMap[this.sightType]!,
        'description': this.description,
      };

  static String _idCreator(double additionalValue) =>
      (DateTime.now().microsecondsSinceEpoch + additionalValue).toString();

  static String getTypeNameBy(SightType type) {
    return _$SightTypeEnumMap[type]!;
  }

  static IconData getTypeIconBy(SightType type) {
    switch (type) {
      case SightType.cafe:
        return CustomIcons.cafe;
      case SightType.hotel:
        return CustomIcons.hotel;
      case SightType.museum:
        return CustomIcons.museum;
      case SightType.park:
        return CustomIcons.park;
      case SightType.restaurant:
        return CustomIcons.restourant;
      case SightType.temple:
        return CustomIcons.museum;
      case SightType.other:
        return CustomIcons.particular_place;
      default:
        CustomIcons.particular_place;
    }
    return Icons.abc;
  }
}
