import 'package:places/data/model/sights/sight.dart';

class SearchedSight {
  SearchedSight(this.sight, this.query);

  final String query;
  final Sight sight;
}
