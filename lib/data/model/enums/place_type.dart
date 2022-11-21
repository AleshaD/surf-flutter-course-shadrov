import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum PlaceType {
  temple,
  monument,
  park,
  theatre,
  museum,
  hotel,
  restaurant,
  cafe,
  other,
}
