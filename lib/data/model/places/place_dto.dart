import 'package:places/data/model/enums/sight_type.dart';

class PlaceDto {
  PlaceDto({
    required this.id,
    required this.lat,
    required this.lng,
    required this.distance,
    required this.name,
    required this.placeType,
    required this.description,
    required this.urls,
  });

  final String description;
  final double distance;
  final String id;
  final double lat;
  final double lng;
  final String name;
  final SightType placeType;
  final List<String> urls;
}
