import 'package:places/data/model/enums/sight_type.dart';

class PlacesFilterRequestDto {
  PlacesFilterRequestDto({
    required this.description,
    required this.lat,
    required this.lon,
    required this.radius,
    required this.typeFilter,
    required this.nameFilter,
  });

  final String description;
  final double lat;
  final double lon;
  final String nameFilter;
  final double radius;
  final SightType typeFilter;
}
