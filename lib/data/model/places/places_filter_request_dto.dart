import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/enums/place_type.dart';

part 'places_filter_request_dto.g.dart';

@JsonSerializable()
class PlacesFilterRequestDto {
  PlacesFilterRequestDto({
    this.lat,
    this.lon,
    this.radius,
    this.typeFilter,
    this.nameFilter,
  }) : assert((lat != null && lon != null && radius != null) ||
            (lat == null && lon == null && radius == null));

  final double? lat;
  final double? lon;
  final String? nameFilter;
  final double? radius;
  final List<PlaceType>? typeFilter;

  factory PlacesFilterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PlacesFilterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesFilterRequestDtoToJson(this);
}
