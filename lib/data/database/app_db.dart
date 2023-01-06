import 'dart:io';

import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:places/data/database/tables/search_querys.dart';
import 'package:places/data/database/tables/visited_sights.dart';
import 'package:places/data/database/tables/want_to_visit_sights.dart';
import 'package:places/data/database/type_converters/list_in_column_converter.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_companion.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [
    SearchQuerys,
    WantToVisitSights,
    VisitedSights,
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<Set<String>> getAllSearchQuerys() async {
    final query = select(searchQuerys)..orderBy([(tbl) => OrderingTerm.desc(tbl.ts)]);

    final list = await query.map((sq) => sq.query).get();
    return list.toSet();
  }

  Stream<Set<String>> get watchAllSearchQuerys =>
      (select(searchQuerys)..orderBy([(tbl) => OrderingTerm.desc(tbl.ts)]))
          .map((sq) => sq.query)
          .watch()
          .map((event) => event.toSet());

  Future<int> addSearchQuery(String query) {
    return into(searchQuerys).insert(
      SearchQuerysCompanion.insert(
        query: query,
        ts: DateTime.now(),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<int> deleteSearchQuery(String query) {
    return (delete(searchQuerys)..where((tbl) => tbl.query.equals(query))).go();
  }

  Future<int> deleteAllSearchQuerys() {
    return delete(searchQuerys).go();
  }

  Future<int> addToWantToVisitSights(SightWantToVisit sight) async {
    final list = await getAllWantToVisitSights();
    return into(wantToVisitSights).insert(
      SightCompanion.fromSightWantToVisit(sight, list.length),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<List<SightWantToVisit>> getAllWantToVisitSights() {
    return (select(wantToVisitSights)
          ..orderBy(
            [
              ((tbl) => OrderingTerm.desc(tbl.sequenceId)),
            ],
          ))
        .get();
  }

  Future<int> deleteFromWantToVisitSights(Sight sight) {
    return (delete(wantToVisitSights)..where((tbl) => tbl.id.equals(sight.id))).go();
  }

  Future<int> addToVisitedSights(SightWantToVisit sight) async {
    final list = await getAllVisitiedSights();
    return into(visitedSights).insert(
      SightCompanion.fromSightWantToVisit(sight, list.length),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<List<SightWantToVisit>> getAllVisitiedSights() {
    return (select(visitedSights)
          ..orderBy(
            [
              ((tbl) => OrderingTerm.desc(tbl.sequenceId)),
            ],
          ))
        .get();
  }

  Future<int> deleteFromVisitedSights(Sight sight) {
    return (delete(visitedSights)..where((tbl) => tbl.id.equals(sight.id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, 'app_db.sqlite'));
      return NativeDatabase.createInBackground(file);
    },
  );
}
