import 'package:dio/dio.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:places/data/providers/sights_api.dart';

class SearchRepository {
  SearchRepository(this._sightApi);

  static final Set<String> _searchHystory = {};
  final SightsApi _sightApi;

  Future<List<SearchedSight>> getSightsBy({required String name}) async {
    final requestFilter = SightsFilterRequestDto(nameFilter: name);
    try {
      final sights = await _sightApi.getFilteredSights(requestFilter);
      saveQueryNameToHystory(name);

      return sights.map((s) => SearchedSight(s, name)).toList();
    } on DioError catch (e) {
      throw (NetworkExceptions.fromDioError(e, AppStrings.tryAganinLater));
    } catch (e) {
      rethrow;
    }
  }

  Set<String> getSearchHystory() => _searchHystory;

  void saveQueryNameToHystory(String name) {
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
