import 'package:drift/drift.dart';
import 'package:places/data/database/tables/sights_table.dart';
import 'package:places/data/model/sights/sight_companion.dart';

@UseRowClass(SightCompanion)
class WantToVisitSights extends SightsTable {
  @override
  String? get tableName => 'want_to_visit_sights';
}
