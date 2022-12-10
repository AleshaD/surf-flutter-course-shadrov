import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/repository/sight_repository.dart';

class SightListScreenModel extends ElementaryModel {
  SightListScreenModel(ErrorHandler errorHandler, {required SightRepository sightRepository})
      : this._sightRepository = sightRepository,
        super(errorHandler: errorHandler);

  final SightRepository _sightRepository;
  late final StreamSubscription<NetworkExceptions> _networkRepoErrorSubscription;

  Future<List<Sight>> loadSights() async {
    return await _sightRepository.getSightsFromFilter(SightFilter.dafult());
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
