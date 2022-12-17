import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/repository/sight_repository.dart';

class FilterScreenModel extends ElementaryModel {
  FilterScreenModel(
    ErrorHandler errorHandler, {
    required SightRepository sightRepository,
  })  : this._sightRepository = sightRepository,
        super(errorHandler: errorHandler);

  final SightRepository _sightRepository;
  late final StreamSubscription<NetworkExceptions> _networkRepoErrorSubscription;

  void updateUserSightFilter(SightFilter filter) {
    _sightRepository.userFilter = filter;
  }

  SightFilter getUserSightFilter() => _sightRepository.userFilter;

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
