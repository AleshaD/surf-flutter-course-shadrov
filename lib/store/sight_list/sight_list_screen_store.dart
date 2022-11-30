import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:places/data/repository/sight_repository.dart';

import '../../data/model/coordinate.dart';
import '../../data/model/sights/sight.dart';

part 'sight_list_screen_store.g.dart';

class SightListScreenStore = SightListScreenStoreBase with _$SightListScreenStore;

abstract class SightListScreenStoreBase with Store {
  SightListScreenStoreBase(this._sightRepository);

  final SightRepository _sightRepository;
  final Coordinate _myCoordinate = Coordinate(lat: 55.75583, lng: 37.6173);

  @observable
  List<Sight> sights = [];

  @observable
  bool isLoading = false;

  @observable
  NetworkExceptions? networkError;

  @action
  void loadSights() async {
    isLoading = true;
    networkError = null;
    try {
      sights = await _getSightsFromFilter(SightFilter.dafult());
    } on DioError catch (e) {
      networkError = NetworkExceptions.fromDioError(e, AppStrings.msgForUserReceive);
    }
    isLoading = false;
  }

  Future<List<Sight>> _getSightsFromFilter(SightFilter filter) async {
    final requestFilter = SightsFilterRequestDto(
      lat: _myCoordinate.lat,
      lng: _myCoordinate.lng,
      radius: filter.toDist,
      typeFilter: filter.activeTypes.toList(),
    );
    final searchedSights = await _sightRepository.getFilteredSights(requestFilter);
    return searchedSights.where((s) => filter.sightInFilter(s, _myCoordinate)).toList();
  }
}
