// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDto _$PlaceDtoFromJson(Map<String, dynamic> json) => PlaceDto(
      distance: (json['distance'] as num).toDouble(),
      id: json['id'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      placeType: json['placeType'],
      description: json['description'],
      urls: json['urls'],
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
