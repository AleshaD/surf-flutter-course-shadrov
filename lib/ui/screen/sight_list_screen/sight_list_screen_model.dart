import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/repository/location_repository.dart';
import 'package:places/data/repository/sight_repository.dart';

class SightListScreenModel extends ElementaryModel {
  SightListScreenModel(
    ErrorHandler errorHandler, {
    required SightRepository sightRepository,
    required LocationRepository locationRepository,
  })  : this._sightRepository = sightRepository,
        this._locationRepository = locationRepository,
        super(errorHandler: errorHandler);

  final SightRepository _sightRepository;
  final LocationRepository _locationRepository;
  late final StreamSubscription<NetworkExceptions> _networkRepoErrorSubscription;

  Future<List<Sight>> loadSights() async {
    final coordinate = await _locationRepository.getCurrentLocation();
    return await _sightRepository.getSightsWithFilter(SightFilter.dafult(), coordinate);
  }

  void _handleNetworkException(NetworkExceptions exc) {
    super.handleError(exc);
  }

  @override
  void init() {
    super.init();
    _networkRepoErrorSubscription = _sightRepository.exceptionStream.stream.listen(
      _handleNetworkException,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _networkRepoErrorSubscription.cancel();
  }
}
