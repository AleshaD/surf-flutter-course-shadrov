import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/enums/place_type.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final PlaceType placeType;
  final String description;

  Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
