import 'package:json_annotation/json_annotation.dart';
import 'package:places/data/model/sights/sight.dart';

import '../enums/sight_type.dart';
part 'sight_want_to_visit.g.dart';

@JsonSerializable()
class SightWantToVisit extends Sight {
  SightWantToVisit({
    required int id,
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required SightType sightType,
    required String description,
    this.wantToVisitTime,
    this.visitedTime,
  }) : super(
          id: id,
          lat: lat,
          lng: lng,
          name: name,
          urls: urls,
          sightType: sightType,
          description: description,
        );

  factory SightWantToVisit.fromSight({
    required Sight sight,
    DateTime? wantToVisitTime,
    DateTime? visitedTime,
  }) {
    return SightWantToVisit(
      id: sight.id,
      lat: sight.lat,
      lng: sight.lng,
      name: sight.name,
      urls: sight.urls,
      sightType: sight.sightType,
      description: sight.description,
      wantToVisitTime: wantToVisitTime,
      visitedTime: visitedTime,
    );
  }

  final DateTime? wantToVisitTime;
  final DateTime? visitedTime;

  factory SightWantToVisit.fromJson(Map<String, dynamic> json) => _$SightWantToVisitFromJson(json);

  Map<String, dynamic> toJson() => _$SightWantToVisitToJson(this);
}
