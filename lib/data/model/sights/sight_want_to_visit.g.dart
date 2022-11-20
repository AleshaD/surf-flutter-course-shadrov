// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sight_want_to_visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SightWantToVisit _$SightWantToVisitFromJson(Map<String, dynamic> json) =>
    SightWantToVisit(
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
      sightType: $enumDecode(_$SightTypeEnumMap, json['placeType']),
      description: json['description'] as String,
      wantToVisitTime: json['wantToVisitTime'] == null
          ? null
          : DateTime.parse(json['wantToVisitTime'] as String),
      visitedTime: json['visitedTime'] == null
          ? null
          : DateTime.parse(json['visitedTime'] as String),
    );

Map<String, dynamic> _$SightWantToVisitToJson(SightWantToVisit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'urls': instance.urls,
      'placeType': _$SightTypeEnumMap[instance.sightType]!,
      'description': instance.description,
      'wantToVisitTime': instance.wantToVisitTime?.toIso8601String(),
      'visitedTime': instance.visitedTime?.toIso8601String(),
    };

const _$SightTypeEnumMap = {
  SightType.temple: 'temple',
  SightType.monument: 'monument',
  SightType.park: 'park',
  SightType.theater: 'theater',
  SightType.museum: 'museum',
  SightType.hotel: 'hotel',
  SightType.restaurant: 'restaurant',
  SightType.cafe: 'cafe',
  SightType.other: 'other',
};
