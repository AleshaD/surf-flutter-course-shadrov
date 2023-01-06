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

class $WantToVisitSightsTable extends WantToVisitSights
    with TableInfo<$WantToVisitSightsTable, SightWantToVisit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WantToVisitSightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
      'lng', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlsMeta = const VerificationMeta('urls');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> urls =
      GeneratedColumn<String>('urls', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($WantToVisitSightsTable.$converterurls);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sightTypeMeta =
      const VerificationMeta('sightType');
  @override
  late final GeneratedColumnWithTypeConverter<SightType, String> sightType =
      GeneratedColumn<String>('sight_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<SightType>(
              $WantToVisitSightsTable.$convertersightType);
  static const VerificationMeta _wantToVisitTimeMeta =
      const VerificationMeta('wantToVisitTime');
  @override
  late final GeneratedColumn<DateTime> wantToVisitTime =
      GeneratedColumn<DateTime>('want_to_visit_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _visitedTimeMeta =
      const VerificationMeta('visitedTime');
  @override
  late final GeneratedColumn<DateTime> visitedTime = GeneratedColumn<DateTime>(
      'visited_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sequenceIdMeta =
      const VerificationMeta('sequenceId');
  @override
  late final GeneratedColumn<int> sequenceId = GeneratedColumn<int>(
      'sequence_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        lat,
        lng,
        name,
        urls,
        description,
        sightType,
        wantToVisitTime,
        visitedTime,
        sequenceId
      ];
  @override
  String get aliasedName => _alias ?? 'want_to_visit_sights';
  @override
  String get actualTableName => 'want_to_visit_sights';
  @override
  VerificationContext validateIntegrity(Insertable<SightWantToVisit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_urlsMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_sightTypeMeta, const VerificationResult.success());
    if (data.containsKey('want_to_visit_time')) {
      context.handle(
          _wantToVisitTimeMeta,
          wantToVisitTime.isAcceptableOrUnknown(
              data['want_to_visit_time']!, _wantToVisitTimeMeta));
    }
    if (data.containsKey('visited_time')) {
      context.handle(
          _visitedTimeMeta,
          visitedTime.isAcceptableOrUnknown(
              data['visited_time']!, _visitedTimeMeta));
    }
    if (data.containsKey('sequence_id')) {
      context.handle(
          _sequenceIdMeta,
          sequenceId.isAcceptableOrUnknown(
              data['sequence_id']!, _sequenceIdMeta));
    } else if (isInserting) {
      context.missing(_sequenceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SightWantToVisit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SightWantToVisit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lng'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      urls: $WantToVisitSightsTable.$converterurls.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}urls'])!),
      sightType: $WantToVisitSightsTable.$convertersightType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}sight_type'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      wantToVisitTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}want_to_visit_time']),
      visitedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}visited_time']),
    );
  }

  @override
  $WantToVisitSightsTable createAlias(String alias) {
    return $WantToVisitSightsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterurls =
      ListInColumnConverter();
  static JsonTypeConverter2<SightType, String, String> $convertersightType =
      const EnumNameConverter<SightType>(SightType.values);
}

class WantToVisitSightsCompanion extends UpdateCompanion<SightWantToVisit> {
  final Value<int> id;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> name;
  final Value<List<String>> urls;
  final Value<String> description;
  final Value<SightType> sightType;
  final Value<DateTime?> wantToVisitTime;
  final Value<DateTime?> visitedTime;
  final Value<int> sequenceId;
  const WantToVisitSightsCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.name = const Value.absent(),
    this.urls = const Value.absent(),
    this.description = const Value.absent(),
    this.sightType = const Value.absent(),
    this.wantToVisitTime = const Value.absent(),
    this.visitedTime = const Value.absent(),
    this.sequenceId = const Value.absent(),
  });
  WantToVisitSightsCompanion.insert({
    this.id = const Value.absent(),
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required String description,
    required SightType sightType,
    this.wantToVisitTime = const Value.absent(),
    this.visitedTime = const Value.absent(),
    required int sequenceId,
  })  : lat = Value(lat),
        lng = Value(lng),
        name = Value(name),
        urls = Value(urls),
        description = Value(description),
        sightType = Value(sightType),
        sequenceId = Value(sequenceId);
  static Insertable<SightWantToVisit> custom({
    Expression<int>? id,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? name,
    Expression<String>? urls,
    Expression<String>? description,
    Expression<String>? sightType,
    Expression<DateTime>? wantToVisitTime,
    Expression<DateTime>? visitedTime,
    Expression<int>? sequenceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (name != null) 'name': name,
      if (urls != null) 'urls': urls,
      if (description != null) 'description': description,
      if (sightType != null) 'sight_type': sightType,
      if (wantToVisitTime != null) 'want_to_visit_time': wantToVisitTime,
      if (visitedTime != null) 'visited_time': visitedTime,
      if (sequenceId != null) 'sequence_id': sequenceId,
    });
  }

  WantToVisitSightsCompanion copyWith(
      {Value<int>? id,
      Value<double>? lat,
      Value<double>? lng,
      Value<String>? name,
      Value<List<String>>? urls,
      Value<String>? description,
      Value<SightType>? sightType,
      Value<DateTime?>? wantToVisitTime,
      Value<DateTime?>? visitedTime,
      Value<int>? sequenceId}) {
    return WantToVisitSightsCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      urls: urls ?? this.urls,
      description: description ?? this.description,
      sightType: sightType ?? this.sightType,
      wantToVisitTime: wantToVisitTime ?? this.wantToVisitTime,
      visitedTime: visitedTime ?? this.visitedTime,
      sequenceId: sequenceId ?? this.sequenceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (urls.present) {
      final converter = $WantToVisitSightsTable.$converterurls;
      map['urls'] = Variable<String>(converter.toSql(urls.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sightType.present) {
      final converter = $WantToVisitSightsTable.$convertersightType;
      map['sight_type'] = Variable<String>(converter.toSql(sightType.value));
    }
    if (wantToVisitTime.present) {
      map['want_to_visit_time'] = Variable<DateTime>(wantToVisitTime.value);
    }
    if (visitedTime.present) {
      map['visited_time'] = Variable<DateTime>(visitedTime.value);
    }
    if (sequenceId.present) {
      map['sequence_id'] = Variable<int>(sequenceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WantToVisitSightsCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('name: $name, ')
          ..write('urls: $urls, ')
          ..write('description: $description, ')
          ..write('sightType: $sightType, ')
          ..write('wantToVisitTime: $wantToVisitTime, ')
          ..write('visitedTime: $visitedTime, ')
          ..write('sequenceId: $sequenceId')
          ..write(')'))
        .toString();
  }
}

class $VisitedSightsTable extends VisitedSights
    with TableInfo<$VisitedSightsTable, SightWantToVisit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitedSightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
      'lng', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlsMeta = const VerificationMeta('urls');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> urls =
      GeneratedColumn<String>('urls', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($VisitedSightsTable.$converterurls);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sightTypeMeta =
      const VerificationMeta('sightType');
  @override
  late final GeneratedColumnWithTypeConverter<SightType, String> sightType =
      GeneratedColumn<String>('sight_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<SightType>($VisitedSightsTable.$convertersightType);
  static const VerificationMeta _wantToVisitTimeMeta =
      const VerificationMeta('wantToVisitTime');
  @override
  late final GeneratedColumn<DateTime> wantToVisitTime =
      GeneratedColumn<DateTime>('want_to_visit_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _visitedTimeMeta =
      const VerificationMeta('visitedTime');
  @override
  late final GeneratedColumn<DateTime> visitedTime = GeneratedColumn<DateTime>(
      'visited_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sequenceIdMeta =
      const VerificationMeta('sequenceId');
  @override
  late final GeneratedColumn<int> sequenceId = GeneratedColumn<int>(
      'sequence_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        lat,
        lng,
        name,
        urls,
        description,
        sightType,
        wantToVisitTime,
        visitedTime,
        sequenceId
      ];
  @override
  String get aliasedName => _alias ?? 'visited_sights';
  @override
  String get actualTableName => 'visited_sights';
  @override
  VerificationContext validateIntegrity(Insertable<SightWantToVisit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_urlsMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_sightTypeMeta, const VerificationResult.success());
    if (data.containsKey('want_to_visit_time')) {
      context.handle(
          _wantToVisitTimeMeta,
          wantToVisitTime.isAcceptableOrUnknown(
              data['want_to_visit_time']!, _wantToVisitTimeMeta));
    }
    if (data.containsKey('visited_time')) {
      context.handle(
          _visitedTimeMeta,
          visitedTime.isAcceptableOrUnknown(
              data['visited_time']!, _visitedTimeMeta));
    }
    if (data.containsKey('sequence_id')) {
      context.handle(
          _sequenceIdMeta,
          sequenceId.isAcceptableOrUnknown(
              data['sequence_id']!, _sequenceIdMeta));
    } else if (isInserting) {
      context.missing(_sequenceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SightWantToVisit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SightWantToVisit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lng'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      urls: $VisitedSightsTable.$converterurls.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}urls'])!),
      sightType: $VisitedSightsTable.$convertersightType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}sight_type'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      wantToVisitTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}want_to_visit_time']),
      visitedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}visited_time']),
    );
  }

  @override
  $VisitedSightsTable createAlias(String alias) {
    return $VisitedSightsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterurls =
      ListInColumnConverter();
  static JsonTypeConverter2<SightType, String, String> $convertersightType =
      const EnumNameConverter<SightType>(SightType.values);
}

class VisitedSightsCompanion extends UpdateCompanion<SightWantToVisit> {
  final Value<int> id;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> name;
  final Value<List<String>> urls;
  final Value<String> description;
  final Value<SightType> sightType;
  final Value<DateTime?> wantToVisitTime;
  final Value<DateTime?> visitedTime;
  final Value<int> sequenceId;
  const VisitedSightsCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.name = const Value.absent(),
    this.urls = const Value.absent(),
    this.description = const Value.absent(),
    this.sightType = const Value.absent(),
    this.wantToVisitTime = const Value.absent(),
    this.visitedTime = const Value.absent(),
    this.sequenceId = const Value.absent(),
  });
  VisitedSightsCompanion.insert({
    this.id = const Value.absent(),
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required String description,
    required SightType sightType,
    this.wantToVisitTime = const Value.absent(),
    this.visitedTime = const Value.absent(),
    required int sequenceId,
  })  : lat = Value(lat),
        lng = Value(lng),
        name = Value(name),
        urls = Value(urls),
        description = Value(description),
        sightType = Value(sightType),
        sequenceId = Value(sequenceId);
  static Insertable<SightWantToVisit> custom({
    Expression<int>? id,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? name,
    Expression<String>? urls,
    Expression<String>? description,
    Expression<String>? sightType,
    Expression<DateTime>? wantToVisitTime,
    Expression<DateTime>? visitedTime,
    Expression<int>? sequenceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (name != null) 'name': name,
      if (urls != null) 'urls': urls,
      if (description != null) 'description': description,
      if (sightType != null) 'sight_type': sightType,
      if (wantToVisitTime != null) 'want_to_visit_time': wantToVisitTime,
      if (visitedTime != null) 'visited_time': visitedTime,
      if (sequenceId != null) 'sequence_id': sequenceId,
    });
  }

  VisitedSightsCompanion copyWith(
      {Value<int>? id,
      Value<double>? lat,
      Value<double>? lng,
      Value<String>? name,
      Value<List<String>>? urls,
      Value<String>? description,
      Value<SightType>? sightType,
      Value<DateTime?>? wantToVisitTime,
      Value<DateTime?>? visitedTime,
      Value<int>? sequenceId}) {
    return VisitedSightsCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      urls: urls ?? this.urls,
      description: description ?? this.description,
      sightType: sightType ?? this.sightType,
      wantToVisitTime: wantToVisitTime ?? this.wantToVisitTime,
      visitedTime: visitedTime ?? this.visitedTime,
      sequenceId: sequenceId ?? this.sequenceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (urls.present) {
      final converter = $VisitedSightsTable.$converterurls;
      map['urls'] = Variable<String>(converter.toSql(urls.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sightType.present) {
      final converter = $VisitedSightsTable.$convertersightType;
      map['sight_type'] = Variable<String>(converter.toSql(sightType.value));
    }
    if (wantToVisitTime.present) {
      map['want_to_visit_time'] = Variable<DateTime>(wantToVisitTime.value);
    }
    if (visitedTime.present) {
      map['visited_time'] = Variable<DateTime>(visitedTime.value);
    }
    if (sequenceId.present) {
      map['sequence_id'] = Variable<int>(sequenceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitedSightsCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('name: $name, ')
          ..write('urls: $urls, ')
          ..write('description: $description, ')
          ..write('sightType: $sightType, ')
          ..write('wantToVisitTime: $wantToVisitTime, ')
          ..write('visitedTime: $visitedTime, ')
          ..write('sequenceId: $sequenceId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $SearchQuerysTable searchQuerys = $SearchQuerysTable(this);
  late final $WantToVisitSightsTable wantToVisitSights =
      $WantToVisitSightsTable(this);
  late final $VisitedSightsTable visitedSights = $VisitedSightsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [searchQuerys, wantToVisitSights, visitedSights];
}
