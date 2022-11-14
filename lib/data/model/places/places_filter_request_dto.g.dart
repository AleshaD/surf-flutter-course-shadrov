// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_filter_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesFilterRequestDto _$PlacesFilterRequestDtoFromJson(
        Map<String, dynamic> json) =>
    PlacesFilterRequestDto(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      typeFilter: (json['typeFilter'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PlaceTypeEnumMap, e))
          .toList(),
      nameFilter: json['nameFilter'] as String?,
    );

Map<String, dynamic> _$PlacesFilterRequestDtoToJson(
        PlacesFilterRequestDto instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'nameFilter': instance.nameFilter,
      'radius': instance.radius,
      'typeFilter':
          instance.typeFilter?.map((e) => _$PlaceTypeEnumMap[e]!).toList(),
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
