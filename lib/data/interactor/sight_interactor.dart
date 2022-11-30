import 'dart:async';

import 'package:dio/dio.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';
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

  final SightRepository _repository;
  final Coordinate _myCoordinate = Coordinate(lat: 55.75583, lng: 37.6173);
  final List<int> _favoriteSightsIds = [127, 139, 330, 329, 352, 390, 129, 132];
  final List<int> _visitedSightsIds = [127, 139, 330, 329];
  final List<SightWantToVisit> _favoriteSights = [];
  final List<SightWantToVisit> _visitedSights = [];
  final exceptionStream = StreamController<NetworkExceptions>.broadcast();

  Future<List<Sight>> getSightsFromFilter(SightFilter filter) async {
    final searchedSights = await getSights(filter.toDist, filter.activeTypes.toList());

    return searchedSights.where((s) => filter.sightInFilter(s, _myCoordinate)).toList();
  }

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

  List<SightWantToVisit> getFavoriteSights() {
    final sights = _filterSightsByDistanceFrom(_myCoordinate, _favoriteSights);

    return sights.map((s) => SightWantToVisit.fromSight(sight: s)).toList();
  }

  bool addToFavorite(Sight sight, [DateTime? date]) {
    return _addToCashList(
      _favoriteSights,
      SightWantToVisit.fromSight(
        sight: sight,
        wantToVisitTime: date,
      ),
    );
  }

  bool isSightInFavorite(Sight sight) {
    return _isSightInCashList(_favoriteSights, sight);
  }

  List<SightWantToVisit> addWantToVisitSightWithDate(Sight sight, DateTime date) {
    if (isSightInFavorite(sight)) {
      return _favoriteSights
          .map((s) => s.id == sight.id
              ? SightWantToVisit.fromSight(
                  sight: sight,
                  wantToVisitTime: date,
                )
              : s)
          .toList();
    } else {
      addToFavorite(sight, date);
      return _favoriteSights;
    }
  }

  bool removeFromFavorites(Sight sight) {
    return _removeFromCashList(_favoriteSights, sight);
  }

  List<SightWantToVisit> getVisitedSights() {
    final sights = _visitedSights;

    return sights
        .map(
          (s) => SightWantToVisit.fromSight(sight: s, visitedTime: DateTime.now()),
        )
        .toList();
  }

  bool addToVisited(Sight sight) {
    return _addToCashList(_visitedSights, sight);
  }

  bool isSightInVisited(Sight sight) {
    return _isSightInCashList(_visitedSights, sight);
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

  void _loadSightsToListByIds(List<SightWantToVisit> list, List<int> ids) {
    ids.forEach((id) async {
      final sight = await _doRepoRequestWithHandleErrors(_repository.getSight(id));
      if (sight != null) list.add(SightWantToVisit.fromSight(sight: sight));
    });
  }

  bool _addToCashList(List<Sight> list, Sight sight) {
    if (!_isSightInCashList(list, sight)) {
      list.add(sight);

      return true;
    } else
      return false;
  }

  bool _isSightInCashList(List<Sight> list, Sight sight) {
    return list.indexWhere((sightInList) => sightInList.id == sight.id) != -1;
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

  void _handleRepoError(DioError dioError) {
    String msgForUser = '';
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectTimeout:
        msgForUser = AppStrings.msgForUserTimeouts;
        break;
      case DioErrorType.response:
        msgForUser = AppStrings.msgForUserReceive;
        break;
      case DioErrorType.cancel:
        msgForUser = AppStrings.msgForUserCancelRequest;
        break;
      case DioErrorType.other:
        msgForUser = AppStrings.msgForUserTotalError;
        break;
      default:
    }

    NetworkExceptions exception = NetworkExceptions.fromDioError(
      dioError,
      msgForUser,
    );

    print(exception.toString());

    exceptionStream.sink.add(exception);
  }
}
