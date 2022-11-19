import 'package:json_annotation/json_annotation.dart';

import '../enums/sight_type.dart';
import '../sight.dart';

part '../sights/sight_dto.g.dart';

@JsonSerializable()
class SightDto extends Sight {
  SightDto({
    required this.distance,
    required int id,
    required double lat,
    required double lng,
    required String name,
    required SightType sightType,
    required String description,
    required List<String> urls,
  }) : super(
          id: id,
          lat: lat,
          lng: lng,
          name: name,
          sightType: sightType,
          description: description,
          urls: urls,
          wantToVisit: false,
          visited: false,
          liked: false,
        );

  final double distance;

  factory SightDto.fromJson(Map<String, dynamic> json) => _$SightDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SightDtoToJson(this);
}
