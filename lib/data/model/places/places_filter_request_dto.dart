import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/enums/place_type.dart';

part 'places_filter_request_dto.g.dart';

@JsonSerializable()
class PlacesFilterRequestDto {
  PlacesFilterRequestDto({
    this.lat,
    this.lng,
    this.radius,
    this.typeFilter,
    this.nameFilter,
  }) : assert((lat != null && lng != null && radius != null) ||
            (lat == null && lng == null && radius == null));

  final double? lat;
  final double? lng;
  final String? nameFilter;
  final double? radius;
  final List<PlaceType>? typeFilter;

  factory PlacesFilterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PlacesFilterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesFilterRequestDtoToJson(this);
}
