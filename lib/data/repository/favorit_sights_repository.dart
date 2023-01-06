import 'package:places/data/database/app_db.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

class FavoritSightsRepository {
  FavoritSightsRepository(this._appDb);

  final AppDb _appDb;

  Future<List<SightWantToVisit>> getWantToVisitSights() async {
    return _appDb.getAllWantToVisitSights();
  }

  Future<bool> addToWantToVisit(Sight sight, [DateTime? date]) async {
    final added = await _appDb.addToWantToVisitSights(
      SightWantToVisit.fromSight(
        sight: sight,
        wantToVisitTime: date,
      ),
    );
    final success = added != 0;
    return success;
  }

  Future<bool> removeFromWantToVisit(Sight sight) async {
    final added = await _appDb.deleteFromWantToVisitSights(sight);
    final success = added != 0;
    return success;
  }

  Future<List<SightWantToVisit>> changeWantToVisitCardsSequences(
    int fromIndex,
    int toIndex,
  ) async {
    // !TODO: написать метод по изменению последовательности в базе данных
    return _appDb.getAllWantToVisitSights();
  }

  Future<List<SightWantToVisit>> getVisitedSights() async {
    return _appDb.getAllVisitiedSights();
  }

  Future<bool> addToVisited(Sight sight, [DateTime? date]) async {
    final added = await _appDb.addToVisitedSights(
      SightWantToVisit.fromSight(
        sight: sight,
        visitedTime: date,
      ),
    );
    final success = added != 0;
    return success;
  }

  Future<bool> removeFromVisited(Sight sight) async {
    final added = await _appDb.deleteFromVisitedSights(sight);
    final success = added != 0;
    return success;
  }

  Future<List<SightWantToVisit>> changeVisitedCardsSequences(
    int fromIndex,
    int toIndex,
  ) async {
    // !TODO: написать метод по изменению последовательности в базе данных
    return _appDb.getAllVisitiedSights();
  }
}
