import 'package:drift/drift.dart';
import 'package:places/data/database/tables/sights_table.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

@UseRowClass(SightWantToVisit)
class WantToVisitSights extends SightsTable {
  @override
  String? get tableName => 'want_to_visit_sights';
}
