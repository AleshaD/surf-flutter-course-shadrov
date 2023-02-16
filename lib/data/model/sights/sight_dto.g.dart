// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SightDto _$SightDtoFromJson(Map<String, dynamic> json) => SightDto(
      distance: (json['distance'] as num?)?.toDouble(),
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      sightType: $enumDecodeNullable(_$SightTypeEnumMap, json['placeType'],
              unknownValue: SightType.other) ??
          SightType.other,
      description: json['description'] as String,
      urls:
          (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$SightDtoToJson(SightDto instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'placeType': _$SightTypeEnumMap[instance.sightType]!,
      'description': instance.description,
      'distance': instance.distance,
      'urls': instance.urls,
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
