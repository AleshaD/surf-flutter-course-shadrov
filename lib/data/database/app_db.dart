import 'dart:io';

import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:places/data/database/tables/search_querys.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [SearchQuerys])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<Set<String>> getAllSearchQuerys() async {
    final query = select(searchQuerys)..orderBy([(tbl) => OrderingTerm.desc(tbl.id)]);

    final list = await query.map((sq) => sq.query).get();
    return list.toSet();
  }

  Stream<Set<String>> get watchAllSearchQuerys =>
      (select(searchQuerys)..orderBy([(tbl) => OrderingTerm.desc(tbl.id)]))
          .map((sq) => sq.query)
          .watch()
          .map((event) => event.toSet());

  Future<int> addSearchQuery(String query) {
    return into(searchQuerys).insert(
      SearchQuerysCompanion(
        query: Value(query),
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
