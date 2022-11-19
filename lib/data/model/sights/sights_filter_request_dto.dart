import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/enums/sight_type.dart';

part 'sights_filter_request_dto.g.dart';

@JsonSerializable()
class SightsFilterRequestDto {
  SightsFilterRequestDto({
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
  final List<SightType>? typeFilter;

  factory SightsFilterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SightsFilterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SightsFilterRequestDtoToJson(this);
}
