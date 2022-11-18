import 'package:dio/dio.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/enums/place_type.dart';
import 'package:places/data/model/places/places_filter_request_dto.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/data/services/location_service.dart';

import '../model/places/place.dart';
import '../model/places/place_dto.dart';

class PlaceInteractor with LocationService {
  PlaceInteractor(this._repository) {
    _initFavoritePlaces();
    _initVisitedPlaces();
  }

  static PlaceInteractor instance = PlaceInteractor(
    PlaceRepository(
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

  final PlaceRepository _repository;
  final Coordinate _myCoordinate = Coordinate(lat: 55.75583, lng: 37.6173);
  final List<int> _favoritePlacesIds = [127, 139, 330, 329, 352, 390, 129, 132];
  final List<int> _visitedPlacesIds = [127, 139, 330, 329];
  final List<Place> _favoritePlaces = [];
  final List<Place> _visitedPlaces = [];

  Future<List<Place>> getPlaces(double radius, List<PlaceType> categorys) async {
    final filter = PlacesFilterRequestDto(
      lat: _myCoordinate.lat,
      lng: _myCoordinate.lng,
      radius: radius,
      typeFilter: categorys,
    );

    List<PlaceDto> places =
        await _doRepoRequestWithHandleErrors(_repository.getFilteredPlaces(filter)) ?? [];

    return _filterPlacesByDistanceFrom(_myCoordinate, places);
  }

  Future<Place?> getPlaceDetails(int id) {
    return _doRepoRequestWithHandleErrors(_repository.getPlace(id));
  }

  Future<Place?> addNewPlace(Place place) {
    return _doRepoRequestWithHandleErrors(_repository.createPlace(place));
  }

  List<Place> getFavoritePlaces() {
    return _filterPlacesByDistanceFrom(_myCoordinate, _favoritePlaces);
  }

  bool addToFavorite(Place place) {
    _favoritePlaces.add(place);
    return true;
  }

  bool removeFromFavorites(Place place) {
    return _removeFromCashList(_favoritePlaces, place);
  }

  List<Place> getVisitedPlaces() {
    return _visitedPlaces;
  }

  bool addToVisited(Place place) {
    _visitedPlaces.add(place);
    return true;
  }

  bool removeFromVisited(Place place) {
    return _removeFromCashList(_visitedPlaces, place);
  }

  void _initFavoritePlaces() {
    _loadPlacesToListByIds(_favoritePlaces, _favoritePlacesIds);
  }

  void _initVisitedPlaces() {
    _loadPlacesToListByIds(_visitedPlaces, _visitedPlacesIds);
  }

  void _loadPlacesToListByIds(List<Place> list, List<int> ids) {
    ids.forEach((id) async {
      final place = await _doRepoRequestWithHandleErrors(_repository.getPlace(id));
      if (place != null) list.add(place);
    });
  }

  bool _removeFromCashList(List<Place> list, Place place) {
    final lengthBeforeRemove = list.length;
    list.removeWhere((searchedPlace) => searchedPlace.id == place.id);
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

  List<Place> _filterPlacesByDistanceFrom(Coordinate center, List<Place> places) {
    places.sort((a, b) {
      return getDistanceBeatwenCoordinates(a.coordinate, center) <
              getDistanceBeatwenCoordinates(b.coordinate, center)
          ? 0
          : 1;
    });
    return places;
  }

  void _handleRepoError(DioError e) {
    print('Get repo error, send something to interface');
  }
}
