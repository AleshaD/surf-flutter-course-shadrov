import 'package:elementary/elementary.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';


class AddSightModel extends ElementaryModel {
  AddSightModel({required SightRepository sightRepository})
      : this._sightRepository = sightRepository,
        super();
  final SightRepository _sightRepository;
  final _maxReCreateAttempts = 3;
  int _reCreateAttempts = 0;

  Future<Sight> addNewSight(Sight sight) async {
    try {
      final createdSight = await _sightRepository.addNewSight(
        sight,
      );
      _reCreateAttempts = 0;
      return createdSight;
    } on NetworkExceptions catch (e) {
      // 409 -> место уже существует, пробуем пересоздать с другим id
      if (e.statusCode == 409 && _reCreateAttempts < _maxReCreateAttempts) {
        _reCreateAttempts++;
        return addNewSight(
          _sightWithNewId(sight),
        );
      } else {
        rethrow;
      }
    } on Object catch (_) {
      rethrow;
    }
  }

  Sight _sightWithNewId(Sight sight) => Sight.onCreate(
      name: sight.name,
      lat: sight.lat,
      lng: sight.lng,
      urls: sight.urls,
      description: sight.description,
      sightType: sight.sightType);
}
