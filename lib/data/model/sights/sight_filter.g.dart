// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sight_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SightFilter _$SightFilterFromJson(Map<String, dynamic> json) => SightFilter(
      fromDist: json['fromDist'],
      toDist: json['toDist'],
      activeTypes: (json['activeTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$SightTypeEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$SightFilterToJson(SightFilter instance) =>
    <String, dynamic>{
      'activeTypes':
          instance.activeTypes.map((e) => _$SightTypeEnumMap[e]!).toList(),
      'fromDist': instance.fromDist,
      'toDist': instance.toDist,
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
  SightType.theatre: 'theatre',
  SightType.other: 'other',
};
