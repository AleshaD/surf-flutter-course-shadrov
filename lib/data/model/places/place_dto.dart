import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/places/place.dart';

part 'place_dto.g.dart';

@JsonSerializable()
class PlaceDto extends Place {
  PlaceDto({
    required this.distance,
    required id,
    required lat,
    required lng,
    required name,
    required placeType,
    required description,
    required urls,
  }) : super(
            id: id,
            lat: lat,
            lng: lng,
            name: name,
            placeType: placeType,
            description: description,
            urls: urls);

  final double distance;

  factory PlaceDto.fromJson(Map<String, dynamic> json) => _$PlaceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDtoToJson(this);
}
