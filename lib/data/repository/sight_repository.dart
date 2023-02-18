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
import 'package:places/data/repository/settings_repository.dart';
import 'package:places/data/services/location_service.dart';

import '../model/sights/sight_dto.dart';

class SightRepository with LocationService {
  SightRepository(this._sightApi, this._settingsRepository);

  final SightsApi _sightApi;
  final SettingsRepository _settingsRepository;
  final exceptionStream = StreamController<NetworkExceptions>.broadcast();

  Future<List<Sight>> getSightsWithUserChosenFilter(Coordinate? coordinate) async {
    return getSightsWithFilter(_settingsRepository.getSightFilter(), coordinate);
  }

  Future<List<Sight>> getSightsWithFilter(
    SightFilter filter,
    Coordinate? coordinate,
  ) async {
    final searchedSights = await getSights(
      filter.toDist,
      filter.activeTypes.toList(),
      coordinate,
    );

    if (coordinate != null)
      return searchedSights.where((s) => filter.sightInFilter(s, coordinate)).toList();
    else
      return searchedSights;
  }

  Future<List<Sight>> getSights(
    double radius,
    List<SightType> categorys, [
    Coordinate? coordinate,
  ]) async {
    final SightsFilterRequestDto filter;
    if (coordinate != null) {
      filter = SightsFilterRequestDto(
        lat: coordinate.lat,
        lng: coordinate.lng,
        radius: radius,
        typeFilter: categorys,
      );
    } else {
      filter = SightsFilterRequestDto(
        typeFilter: categorys,
      );
    }

    List<SightDto> sights =
        await _doRepoRequestWithHandleErrors(_sightApi.getFilteredSights(filter)) ?? [];

    if (coordinate != null) {
      return _filterSightsByDistanceFrom(coordinate, sights);
    } else
      return sights;
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
