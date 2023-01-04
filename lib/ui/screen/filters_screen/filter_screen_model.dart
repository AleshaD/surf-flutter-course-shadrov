import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/repository/settings_repository.dart';
import 'package:places/data/repository/sight_repository.dart';

class FilterScreenModel extends ElementaryModel {
  FilterScreenModel(
    ErrorHandler errorHandler, {
    required SightRepository sightRepository,
    required SettingsRepository settingsRepository,
  })  : this._sightRepository = sightRepository,
        this._settingsRepository = settingsRepository,
        super(errorHandler: errorHandler);

  final SightRepository _sightRepository;
  final SettingsRepository _settingsRepository;
  late final StreamSubscription<NetworkExceptions> _networkRepoErrorSubscription;

  void updateUserSightFilter(SightFilter filter) {
    _settingsRepository.setSightFilter(filter);
  }

  SightFilter getUserSightFilter() {
    return _settingsRepository.getSightFilter();
  }

  Future<List<Sight>> getSightFromFilter(SightFilter filter) async {
    final sights = await _sightRepository.getSightsFromFilter(filter);

    return sights;
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
