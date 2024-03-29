import 'package:elementary/elementary.dart';
import 'package:geolocator/geolocator.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/repository/favorit_sights_repository.dart';
import 'package:places/data/repository/location_repository.dart';
import 'package:places/data/repository/sight_repository.dart';

class SightsMapModel extends ElementaryModel {
  SightsMapModel(
    ErrorHandler errorHandler,
    LocationRepository locationRepository,
    SightRepository sightRepository,
    FavoritSightsRepository favoritSightsRepository,
  )   : this._locationRepository = locationRepository,
        this._sightRepository = sightRepository,
        this._favoritSightsRepository = favoritSightsRepository,
        super(errorHandler: errorHandler);

  final LocationRepository _locationRepository;
  final SightRepository _sightRepository;
  final FavoritSightsRepository _favoritSightsRepository;

  Future<Coordinate?> getUserCoordinate() async {
    return await _locationRepository.getCurrentOrPreviousCoordinate();
  }

  Future<Position?> getUserPosition({bool forcesRequest = false}) async {
    return await _locationRepository.getUserPosition(withRequest: forcesRequest);
  }

  Future<List<Sight>> getSights(
    Coordinate? coordinate,
  ) async {
    return await _sightRepository.getSightsWithUserChosenFilter(coordinate);
  }

  /// Добавить в посещённые места.
  void addToVisitedSights(Sight sight) {
    _favoritSightsRepository.addToVisited(sight, DateTime.now());
  }
}
