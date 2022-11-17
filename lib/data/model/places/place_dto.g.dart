// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDto _$PlaceDtoFromJson(Map<String, dynamic> json) => PlaceDto(
      distance: (json['distance'] as num).toDouble(),
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['placeType']),
      description: json['description'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlaceDtoToJson(PlaceDto instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'urls': instance.urls,
      'placeType': _$PlaceTypeEnumMap[instance.placeType]!,
      'description': instance.description,
      'distance': instance.distance,
    };

const _$PlaceTypeEnumMap = {
  PlaceType.temple: 'temple',
  PlaceType.monument: 'monument',
  PlaceType.park: 'park',
  PlaceType.theatre: 'theatre',
  PlaceType.museum: 'museum',
  PlaceType.hotel: 'hotel',
  PlaceType.restaurant: 'restaurant',
  PlaceType.cafe: 'cafe',
  PlaceType.other: 'other',
};
