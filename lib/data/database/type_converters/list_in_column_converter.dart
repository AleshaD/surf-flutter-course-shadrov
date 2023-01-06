import 'dart:convert';

import 'package:drift/drift.dart';

class ListInColumnConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    final List<dynamic> l = json.decode(fromDb) as List;
    return l.map((e) => e as String).toList();
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}
