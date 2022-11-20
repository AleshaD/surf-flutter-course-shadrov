import 'package:dio/dio.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:places/data/repository/sight_repository.dart';

class SearchInteractor {
  SearchInteractor(this._repository);

  static final instance = SearchInteractor(
    SightRepository(
      Dio(
        BaseOptions(
          connectTimeout: _timeout,
          sendTimeout: _timeout,
          receiveTimeout: _timeout,
          responseType: ResponseType.json,
        ),
      ),
    ),
  );

  static const int _timeout = 3000;
  static final Set<String> _searchHystory = {};
  final SightRepository _repository;

  Future<List<SearchedSight>> getSightsBy({required String name}) async {
    final requestFilter = SightsFilterRequestDto(nameFilter: name);
    try {
      final sights = await _repository.getFilteredSights(requestFilter);
      _searchHystory.add(name);
      return sights.map((s) => SearchedSight(s, name)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Set<String> getSearchHystory() => _searchHystory;

  void saveToHystory(String name) {
    if (name.isNotEmpty) {
      // добавить в начало списка
      var list = _searchHystory.toList();
      list.insert(0, name.trim());
      cleanHystory();
      list.forEach((str) {
        _searchHystory.add(str);
      });
    }
  }

  bool removeFromHystory(String name) {
    return _searchHystory.remove(name);
  }

  Set<String> cleanHystory() {
    _searchHystory.clear();
    return _searchHystory;
  }
}