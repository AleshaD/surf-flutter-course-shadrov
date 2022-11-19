import 'package:dio/dio.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/services/location_service.dart';

import '../model/sights/sight_dto.dart';

class SightInteractor with LocationService {
  SightInteractor(this._repository) {
    _initFavoriteSights();
    _initVisitedSights();
  }

  static SightInteractor instance = SightInteractor(
    SightRepository(
      Dio(
        BaseOptions(
          connectTimeout: 10000,
          sendTimeout: 10000,
          receiveTimeout: 10000,
          responseType: ResponseType.json,
        ),
      ),
    ),
  );

  final SightRepository _repository;
  final Coordinate _myCoordinate = Coordinate(lat: 55.75583, lng: 37.6173);
  final List<int> _favoriteSightsIds = [127, 139, 330, 329, 352, 390, 129, 132];
  final List<int> _visitedSightsIds = [127, 139, 330, 329];
  final List<Sight> _favoriteSights = [];
  final List<Sight> _visitedSights = [];

  Future<List<Sight>> getSights(double radius, List<SightType> categorys) async {
    final filter = SightsFilterRequestDto(
      lat: _myCoordinate.lat,
      lng: _myCoordinate.lng,
      radius: radius,
      typeFilter: categorys,
    );

    List<SightDto> sights =
        await _doRepoRequestWithHandleErrors(_repository.getFilteredSights(filter)) ?? [];

    return _filterSightsByDistanceFrom(_myCoordinate, sights);
  }

  Future<Sight?> getSightDetails(int id) {
    return _doRepoRequestWithHandleErrors(_repository.getSight(id));
  }

  Future<Sight?> addNewSight(Sight sight) {
    return _doRepoRequestWithHandleErrors(_repository.createSight(sight));
  }

  List<Sight> getFavoriteSights() {
    return _filterSightsByDistanceFrom(_myCoordinate, _favoriteSights);
  }

  bool addToFavorite(Sight sight) {
    _favoriteSights.add(sight);
    return true;
  }

  bool removeFromFavorites(Sight sight) {
    return _removeFromCashList(_favoriteSights, sight);
  }

  List<Sight> getVisitedSights() {
    return _visitedSights;
  }

  bool addToVisited(Sight sight) {
    _visitedSights.add(sight);
    return true;
  }

  bool removeFromVisited(Sight sight) {
    return _removeFromCashList(_visitedSights, sight);
  }

  void _initFavoriteSights() {
    _loadSightsToListByIds(_favoriteSights, _favoriteSightsIds);
  }

  void _initVisitedSights() {
    _loadSightsToListByIds(_visitedSights, _visitedSightsIds);
  }

  void _loadSightsToListByIds(List<Sight> list, List<int> ids) {
    ids.forEach((id) async {
      final sight = await _doRepoRequestWithHandleErrors(_repository.getSight(id));
      if (sight != null) list.add(sight);
    });
  }

  bool _removeFromCashList(List<Sight> list, Sight sight) {
    final lengthBeforeRemove = list.length;
    list.removeWhere((searchedSight) => searchedSight.id == sight.id);
    return lengthBeforeRemove != list.length;
  }

  Future<T?> _doRepoRequestWithHandleErrors<T>(Future<T> request) async {
    try {
      T? result = await request;
      return result;
    } on DioError catch (e) {
      _handleRepoError(e);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  List<Sight> _filterSightsByDistanceFrom(Coordinate center, List<Sight> sights) {
    sights.sort((a, b) {
      return getDistanceBeatwenCoordinates(a.coordinate, center) <
              getDistanceBeatwenCoordinates(b.coordinate, center)
          ? 0
          : 1;
    });
    return sights;
  }

  void _handleRepoError(DioError e) {
    print('Get repo error, send something to interface');
  }
}
