import 'package:places/data/model/place.dart';

class SearchedSight {
  SearchedSight(this.sight, this.query);

  final String query;
  final Place sight;
}
