import 'dart:async';

import 'package:dio/dio.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/database/app_db.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:places/data/providers/sights_api.dart';

class SearchRepository {
  SearchRepository(
    this._sightApi,
    this._appDb,
  ) {
    _doPreloadAndSaveHystory();
  }

  final SightsApi _sightApi;
  final AppDb _appDb;

  late final Stream<Set<String>> searchHistoryStream = _appDb.watchAllSearchQuerys;

  Set<String> _preLoadHystory = {};

  Future<List<SearchedSight>> getSightsBy({required String name}) async {
    final requestFilter = SightsFilterRequestDto(nameFilter: name);
    try {
      saveQueryNameToHystory(name);
      final sights = await _sightApi.getFilteredSights(requestFilter);

      return sights.map((s) => SearchedSight(s, name)).toList();
    } on DioError catch (e) {
      throw (NetworkExceptions.fromDioError(e, AppStrings.tryAganinLater));
    } catch (e) {
      rethrow;
    }
  }

  Future<Set<String>> getSearchHystory() async {
    try {
      final searches = await _appDb.getAllSearchQuerys();
      return searches.toSet();
    } catch (e) {
      rethrow;
    }
  }

  Set<String> getPreloadHystory() => _preLoadHystory;

  void saveQueryNameToHystory(String name) {
    if (name.isNotEmpty) {
      _appDb.addSearchQuery(name);
    }
  }

  Future<bool> removeFromHystory(String name) async {
    final deletedRaws = await _appDb.deleteSearchQuery(name);
    final isSuccess = deletedRaws > 0;

    return isSuccess;
  }

  void cleanHystory() {
    _appDb.deleteAllSearchQuerys();
  }

  Future<void> _doPreloadAndSaveHystory() async {
    final hyst = await getSearchHystory();
    _preLoadHystory = hyst;
  }
}
