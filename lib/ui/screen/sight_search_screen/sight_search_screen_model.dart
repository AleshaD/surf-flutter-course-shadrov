import 'package:elementary/elementary.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/data/repository/search_repository.dart';

class SightSearchScreenModel extends ElementaryModel {
  SightSearchScreenModel(
    ErrorHandler errorHandler,
    SearchRepository searchRepository,
  )   : this._searchRepository = searchRepository,
        super(errorHandler: errorHandler);

  final SearchRepository _searchRepository;
  Stream<Set<String>> get historyOfQueryStream => _searchRepository.searchHistoryStreamCtrl.stream;

  Future<List<SearchedSight>> getSightsBy({required String query}) async {
    try {
      final sights = await _searchRepository.getSightsBy(name: query);

      return sights;
    } catch (e) {
      super.handleError(e);

      return [];
    }
  }

  Set<String> getSearchHistory() {
    return _searchRepository.getSearchHystory();
  }

  void removeFromHistory(String query) {
    _searchRepository.removeFromHystory(query);
  }

  void deleteAllHistory() {
    _searchRepository.cleanHystory();
  }
}
