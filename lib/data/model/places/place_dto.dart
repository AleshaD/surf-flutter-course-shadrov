import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/enums/place_type.dart';
import 'package:places/data/model/places/place.dart';

part 'place_dto.g.dart';

@JsonSerializable()
class PlaceDto extends Place {
  PlaceDto({
    required this.distance,
    required int id,
    required double lat,
    required double lng,
    required String name,
    required PlaceType placeType,
    required String description,
    required List<String> urls,
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
