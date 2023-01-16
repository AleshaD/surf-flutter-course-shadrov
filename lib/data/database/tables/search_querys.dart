import 'package:drift/drift.dart';

class SearchQuerys extends Table {
  DateTimeColumn get ts => dateTime()();
  TextColumn get query => text()();

  @override
  Set<Column<Object>>? get primaryKey => {query};
}
