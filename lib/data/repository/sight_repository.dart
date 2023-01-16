import 'dart:async';

import 'package:dio/dio.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/providers/sights_api.dart';
import 'package:places/data/services/location_service.dart';

import '../model/sights/sight_dto.dart';

class SightRepository with LocationService {
  SightRepository(this._sightApi);

  final SightsApi _sightApi;
  final Coordinate _myCoordinate = Coordinate(lat: 55.75583, lng: 37.6173);
  final exceptionStream = StreamController<NetworkExceptions>.broadcast();
  final Completer<bool> _favoriteSightsAndVisitedCompleter = new Completer();
  late final Future<bool> initedFavotireAndVisitedSights =
      _favoriteSightsAndVisitedCompleter.future;

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
        await _doRepoRequestWithHandleErrors(_sightApi.getFilteredSights(filter)) ?? [];

    return _filterSightsByDistanceFrom(_myCoordinate, sights);
  }

  Future<Sight?> getSightDetails(int id) {
    return _doRepoRequestWithHandleErrors(_sightApi.getSight(id));
  }

  Future<Sight> addNewSight(Sight sight) {
    return _doRepoRequestWithHandleErrors(_sightApi.createSight(sight));
  }

  Future<T> _doRepoRequestWithHandleErrors<T>(Future<T> request) async {
    try {
      T result = await request;

      return result;
    } on DioError catch (e) {
      _handleRepoError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  List<T> _filterSightsByDistanceFrom<T>(Coordinate center, List<T> sights) {
    (sights as List<Sight>).sort((a, b) {
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
