import 'package:drift/drift.dart';

class SearchQuerys extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text()();
}
