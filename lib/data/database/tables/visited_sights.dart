import 'package:drift/drift.dart';
import 'package:places/data/database/tables/sights_table.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

@UseRowClass(SightWantToVisit)
class VisitedSights extends SightsTable {
  @override
  String? get tableName => 'visited_sights';
}
