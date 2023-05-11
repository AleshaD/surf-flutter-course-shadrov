import 'dart:io';

import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:places/data/database/tables/search_querys.dart';
import 'package:places/data/database/tables/sights_table.dart';
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

  Future<int> addToWantToVisitSights(SightWantToVisit sight, {int? sequenceId}) async {
    return await _addSightTo(wantToVisitSights, sight, sequenceId: sequenceId);
  }

  Future<List<SightWantToVisit>> getAllWantToVisitSights() async {
    return await _getAllSightsFrom(wantToVisitSights);
  }

  Future<int> deleteFromWantToVisitSights(Sight sight) async {
    return await _deleteSightFrom(wantToVisitSights, sight);
  }

  Future<void> changeSequenceWantToVisit({
    required SightWantToVisit sight,
    required SightWantToVisit? putAboveThisSight,
  }) async {
    await _changeCardSequencesIn(
      wantToVisitSights,
      sight: sight,
      putAboveThisSight: putAboveThisSight,
    );
  }

  Future<int> addToVisitedSights(SightWantToVisit sight) async {
    return await _addSightTo(visitedSights, sight);
  }

  Future<List<SightWantToVisit>> getAllVisitiedSights() async {
    return await _getAllSightsFrom(visitedSights);
  }

  Future<int> deleteFromVisitedSights(Sight sight) {
    return _deleteSightFrom(visitedSights, sight);
  }

  Future<void> changeSequenceVisited({
    required SightWantToVisit sight,
    required SightWantToVisit? putAboveThisSight,
  }) async {
    await _changeCardSequencesIn(
      visitedSights,
      sight: sight,
      putAboveThisSight: putAboveThisSight,
    );
  }

  int get _nowMsSinceEpoch => DateTime.now().millisecondsSinceEpoch;

  Future<List<SightWantToVisit>>
      _getAllSightsFrom<M extends SightsTable, T extends TableInfo<M, SightCompanion>>(
    T table,
  ) async {
    final listCompanions = await (select(table)
          ..orderBy(
            [
              ((tbl) => OrderingTerm.desc(tbl.sequenceId)),
            ],
          ))
        .get();
    return listCompanions;
  }

  Future<int> _addSightTo<M extends SightsTable, T extends TableInfo<M, SightCompanion>>(
    T table,
    SightWantToVisit sight, {
    int? sequenceId,
  }) async {
    if (sequenceId == null) {
      final sightInDb = await (select(table)..where((tbl) => tbl.id.equals(sight.id)))
          .getSingleOrNull();
      if (sightInDb != null) sequenceId = sightInDb.sequenceId;
    }
    return into(table).insert(
      SightCompanion.fromSightWantToVisit(sight, sequenceId ?? _nowMsSinceEpoch),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<int>
      _deleteSightFrom<M extends SightsTable, T extends TableInfo<M, SightCompanion>>(
    T table,
    Sight sight,
  ) async {
    return await (delete(table)..where((tbl) => tbl.id.equals(sight.id))).go();
  }

  Future<void> _changeCardSequencesIn<M extends SightsTable,
      T extends TableInfo<M, SightCompanion>>(
    T table, {
    required SightWantToVisit sight,
    required SightWantToVisit? putAboveThisSight,
  }) async {
    final putToStart = putAboveThisSight == null;
    int? newSequenceId;
    if (putToStart) {
      newSequenceId = 0;
    } else {
      final putAboveThisSightCompanion = await (select(table)
            ..where((tbl) => tbl.id.equals(putAboveThisSight.id)))
          .getSingle();
      newSequenceId = putAboveThisSightCompanion.sequenceId + 1;
    }

    await _updateIdInAllTopSights(
      fromSequenceId: newSequenceId,
      table: table,
    );
    await _addSightTo(table, sight, sequenceId: newSequenceId);
  }

  Future<void> _updateIdInAllTopSights<M extends SightsTable,
      T extends TableInfo<M, SightCompanion>>({
    required int fromSequenceId,
    required T table,
  }) async {
    final topSights = await (select(table)
          ..where((tbl) => tbl.sequenceId.isBiggerOrEqualValue(fromSequenceId)))
        .get();

    await batch(
      (batch) => batch.insertAllOnConflictUpdate(
        wantToVisitSights,
        topSights
            .map((e) => SightCompanion.fromSightWantToVisit(e, e.sequenceId + 1))
            .toList(),
      ),
    );
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
