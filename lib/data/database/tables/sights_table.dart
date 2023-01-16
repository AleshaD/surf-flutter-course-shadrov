import 'package:drift/drift.dart';
import 'package:places/data/database/type_converters/list_in_column_converter.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

@UseRowClass(SightWantToVisit)
class SightsTable extends Table {
  IntColumn get id => integer()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get name => text()();
  TextColumn get urls => text().map(ListInColumnConverter())();
  TextColumn get description => text()();
  TextColumn get sightType => textEnum<SightType>()();
  DateTimeColumn get wantToVisitTime => dateTime().nullable()();
  DateTimeColumn get visitedTime => dateTime().nullable()();
  IntColumn get sequenceId => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
