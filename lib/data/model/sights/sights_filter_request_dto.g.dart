// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sights_filter_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SightsFilterRequestDto _$SightsFilterRequestDtoFromJson(
        Map<String, dynamic> json) =>
    SightsFilterRequestDto(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      typeFilter: (json['typeFilter'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SightTypeEnumMap, e))
          .toList(),
      nameFilter: json['nameFilter'] as String?,
    );

Map<String, dynamic> _$SightsFilterRequestDtoToJson(
        SightsFilterRequestDto instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'nameFilter': instance.nameFilter,
      'radius': instance.radius,
      'typeFilter':
          instance.typeFilter?.map((e) => _$SightTypeEnumMap[e]!).toList(),
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
