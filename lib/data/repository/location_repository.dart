import 'package:geolocator/geolocator.dart';

import 'package:places/data/model/coordinate.dart';
import 'package:places/data/providers/local_storage.dart';

class LocationRepository {
  LocationRepository({
    required LocalStorage storage,
  }) : this._storage = storage;

  final LocalStorage _storage;

  Future<Position?> getUserPosition() async {
    bool hasAccess;
    if (await _hasPermission()) {
      hasAccess = true;
    } else {
      hasAccess = await _requestPermission();
    }

    Position? position;
    if (hasAccess) {
      position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } else {
      try {
        position = await Geolocator.getLastKnownPosition();
      } catch (e) {
        return null;
      }
    }

    return position;
  }

  Future<Coordinate?> getCurrentOrPreviousCoordinate() async {
    final position = await getUserPosition();
    return position != null
        ? Coordinate(lat: position.latitude, lng: position.longitude)
        : null;
  }

  Future<bool> _hasPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    var permission = await Geolocator.checkPermission();
    return !_isDenied(permission);
  }

  Future<bool> _requestPermission() async {
    /// не запрашиваем разрешение на координаты чаще чем раз в сутки
    final prevRequestedTime = _storage.getPreviousLocationRequestTime();
    final now = DateTime.now();
    if (now.difference(prevRequestedTime).inHours < 24) return false;

    _storage.setPreviousLocationRequestTime(now);
    final permission = await Geolocator.requestPermission();
    return !_isDenied(permission);
  }

  bool _isDenied(LocationPermission p) =>
      p == LocationPermission.denied || p == LocationPermission.deniedForever;
}
