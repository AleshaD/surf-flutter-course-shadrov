import 'package:drift/drift.dart';
import 'package:places/data/database/type_converters/list_in_column_converter.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

class SightCompanion extends SightWantToVisit implements Insertable<SightCompanion> {
  SightCompanion({
    required int id,
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required SightType sightType,
    required String description,
    required this.sequenceId,
    DateTime? wantToVisitTime,
    DateTime? visitedTime,
  }) : super(
          id: id,
          lat: lat,
          lng: lng,
          name: name,
          urls: urls,
          sightType: sightType,
          description: description,
          wantToVisitTime: wantToVisitTime,
          visitedTime: visitedTime,
        );

  factory SightCompanion.fromSight(
    Sight sight,
    int sequenceId, {
    DateTime? wantToVisitTime,
    DateTime? visitedTime,
  }) {
    return SightCompanion(
      id: sight.id,
      lat: sight.lat,
      lng: sight.lng,
      name: sight.name,
      urls: sight.urls,
      sightType: sight.sightType,
      description: sight.description,
      sequenceId: sequenceId,
      wantToVisitTime: wantToVisitTime,
      visitedTime: visitedTime,
    );
  }

  factory SightCompanion.fromSightWantToVisit(
      SightWantToVisit sightWantToVisit, int sequencesId) {
    return SightCompanion.fromSight(
      sightWantToVisit,
      sequencesId,
      wantToVisitTime: sightWantToVisit.wantToVisitTime,
      visitedTime: sightWantToVisit.visitedTime,
    );
  }

  final int sequenceId;

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['name'] = Variable<String>(name);
    final converter = converterurls;
    map['urls'] = Variable<String>(converter.toSql(urls));
    map['description'] = Variable<String>(description);
    final typeConverter = convertersightType;
    map['want_to_visit_time'] = Variable<DateTime>(wantToVisitTime);
    map['visited_time'] = Variable<DateTime>(visitedTime);
    map['sight_type'] = Variable<String>(typeConverter.toSql(sightType));
    map['sequence_id'] = Variable<int>(sequenceId);
    return map;
  }

  final TypeConverter<List<String>, String> converterurls = ListInColumnConverter();
  final JsonTypeConverter2<SightType, String, String> convertersightType =
      const EnumNameConverter<SightType>(SightType.values);
}
