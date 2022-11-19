// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sight _$SightFromJson(Map<String, dynamic> json) => Sight(
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
      sightType: $enumDecode(_$SightTypeEnumMap, json['placeType']),
      description: json['description'] as String,
      wantToVisit: json['wantToVisit'] as bool,
      visited: json['visited'] as bool,
      liked: json['liked'] as bool,
      wantToVisitAtDate: json['wantToVisitAtDate'] == null
          ? null
          : DateTime.parse(json['wantToVisitAtDate'] as String),
      visitedDate: json['visitedDate'] == null
          ? null
          : DateTime.parse(json['visitedDate'] as String),
    );

Map<String, dynamic> _$SightToJson(Sight instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'urls': instance.urls,
      'placeType': _$SightTypeEnumMap[instance.sightType]!,
      'description': instance.description,
      'visitedDate': instance.visitedDate?.toIso8601String(),
      'wantToVisitAtDate': instance.wantToVisitAtDate?.toIso8601String(),
      'wantToVisit': instance.wantToVisit,
      'visited': instance.visited,
      'liked': instance.liked,
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
