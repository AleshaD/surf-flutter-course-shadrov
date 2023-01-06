// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $SearchQuerysTable extends SearchQuerys
    with TableInfo<$SearchQuerysTable, SearchQuery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchQuerysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [ts, query];
  @override
  String get aliasedName => _alias ?? 'search_querys';
  @override
  String get actualTableName => 'search_querys';
  @override
  VerificationContext validateIntegrity(Insertable<SearchQuery> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query};
  @override
  SearchQuery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchQuery(
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
    );
  }

  @override
  $SearchQuerysTable createAlias(String alias) {
    return $SearchQuerysTable(attachedDatabase, alias);
  }
}

class SearchQuery extends DataClass implements Insertable<SearchQuery> {
  final DateTime ts;
  final String query;
  const SearchQuery({required this.ts, required this.query});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ts'] = Variable<DateTime>(ts);
    map['query'] = Variable<String>(query);
    return map;
  }

  SearchQuerysCompanion toCompanion(bool nullToAbsent) {
    return SearchQuerysCompanion(
      ts: Value(ts),
      query: Value(query),
    );
  }

  factory SearchQuery.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchQuery(
      ts: serializer.fromJson<DateTime>(json['ts']),
      query: serializer.fromJson<String>(json['query']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ts': serializer.toJson<DateTime>(ts),
      'query': serializer.toJson<String>(query),
    };
  }

  SearchQuery copyWith({DateTime? ts, String? query}) => SearchQuery(
        ts: ts ?? this.ts,
        query: query ?? this.query,
      );
  @override
  String toString() {
    return (StringBuffer('SearchQuery(')
          ..write('ts: $ts, ')
          ..write('query: $query')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ts, query);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchQuery &&
          other.ts == this.ts &&
          other.query == this.query);
}

class SearchQuerysCompanion extends UpdateCompanion<SearchQuery> {
  final Value<DateTime> ts;
  final Value<String> query;
  const SearchQuerysCompanion({
    this.ts = const Value.absent(),
    this.query = const Value.absent(),
  });
  SearchQuerysCompanion.insert({
    required DateTime ts,
    required String query,
  })  : ts = Value(ts),
        query = Value(query);
  static Insertable<SearchQuery> custom({
    Expression<DateTime>? ts,
    Expression<String>? query,
  }) {
    return RawValuesInsertable({
      if (ts != null) 'ts': ts,
      if (query != null) 'query': query,
    });
  }

  SearchQuerysCompanion copyWith({Value<DateTime>? ts, Value<String>? query}) {
    return SearchQuerysCompanion(
      ts: ts ?? this.ts,
      query: query ?? this.query,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchQuerysCompanion(')
          ..write('ts: $ts, ')
          ..write('query: $query')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $SearchQuerysTable searchQuerys = $SearchQuerysTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [searchQuerys];
}
