import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/repository/favorit_sights_repository.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

part 'visiting_event.dart';
part 'visiting_state.dart';
part 'visiting_bloc.freezed.dart';

class VisitingBloc extends Bloc<VisitingEvent, VisitingState> {
  VisitingBloc({required FavoritSightsRepository favoriteSightRepository})
      : _favoriteSightRepository = favoriteSightRepository,
        super(const VisitingState.loadingState()) {
    on<VisitingEvent>(
      (event, emitter) => event.map<Future<void>>(
          loadSights: (event) => _loadSights(event, emitter),
          deleteFromVisited: (event) => _deleteFromVisited(event, emitter),
          deleteFromWantToVisit: (event) => _deleteFromWantToVisit(event, emitter),
          changeVisitedCardsSequences: (event) =>
              _changeVisitedCardsSequences(event, emitter),
          changeWantToVisitCardsSequences: (event) =>
              _changeWantToVisitCardsSequences(event, emitter),
          addWantToVisitTime: (event) => _addWantToVisitTime(event, emitter),
          addToWantToVisit: (event) => _addToWantToVisit(event, emitter)),
    );
  }

  final FavoritSightsRepository _favoriteSightRepository;

  _loadSights(_LoadSights event, Emitter<VisitingState> emitter) async {
    if (!event.hideLoading) {
      emitter(VisitingState.loadingState());
    }

    final List<SightWantToVisit> visitedSights =
        await _favoriteSightRepository.getVisitedSights();
    final List<SightWantToVisit> wantToVisitSights =
        await _favoriteSightRepository.getWantToVisitSights();

    emitter(VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights], visitedSights: [...visitedSights]));
  }

  Future<void> _addWantToVisitTime(
      _AddWantToVisitTime event, Emitter<VisitingState> emitter) async {
    await _favoriteSightRepository.addToWantToVisit(event.sight, event.date);
    final wantToVisitSights = await _favoriteSightRepository.getWantToVisitSights();

    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights],
        visitedSights: state.visitedSights,
      ),
    );
  }

  Future<void> _changeVisitedCardsSequences(
      _ChangeVisitedCardsSequences event, Emitter<VisitingState> emitter) async {
    final changedSight = state.visitedSights[event.fromIndex];
    final aboveIndex = event.toIndex;
    final putAboveSight =
        aboveIndex < state.visitedSights.length ? state.visitedSights[aboveIndex] : null;
    final visitedSights = await _favoriteSightRepository.changeVisitedCardsSequences(
      changedSight,
      putAboveSight,
    );
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: state.wantToVisitSights,
        visitedSights: [...visitedSights],
      ),
    );
  }

  Future<void> _changeWantToVisitCardsSequences(
      _ChangeWantToVisitCardsSequences event, Emitter<VisitingState> emitter) async {
    final changedSight = state.wantToVisitSights[event.fromIndex];
    final aboveIndex = event.toIndex;
    final putAboveSight = aboveIndex < state.wantToVisitSights.length
        ? state.wantToVisitSights[aboveIndex]
        : null;
    final wantToVisitSights =
        await _favoriteSightRepository.changeWantToVisitCardsSequences(
      changedSight,
      putAboveSight,
    );
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights],
        visitedSights: state.visitedSights,
      ),
    );
  }

  Future<void> _deleteFromVisited(
      _DeleteFromVisited event, Emitter<VisitingState> emitter) async {
    _favoriteSightRepository.removeFromVisited(event.sight);
    final visitedSights = await _favoriteSightRepository.getVisitedSights();
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: state.wantToVisitSights,
        visitedSights: [...visitedSights],
      ),
    );
  }

  Future<void> _deleteFromWantToVisit(
    _DeleteFromWantToVisit event,
    Emitter<VisitingState> emitter,
  ) async {
    await _favoriteSightRepository.removeFromWantToVisit(event.sight);
    final wantToVisitSights = await _favoriteSightRepository.getWantToVisitSights();
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights],
        visitedSights: state.visitedSights,
      ),
    );
  }

  Future<void> _addToWantToVisit(
      _AddToWantToVisit event, Emitter<VisitingState> emitter) async {
    await _favoriteSightRepository.addToWantToVisit(event.sight);
    final wantToVisitSights = await _favoriteSightRepository.getWantToVisitSights();
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights],
        visitedSights: state.visitedSights,
      ),
    );
  }

  // Отлов ошибок когда будет ассинхронный приём отмеченных мест из репозитория
  Future<List<SightWantToVisit>?> _tryGetSights(
    Future<List<SightWantToVisit>> getSights,
    Emitter<VisitingState> emitter,
  ) async {
    try {
      final List<SightWantToVisit>? sights = await getSights;

      return sights;
    } on NetworkExceptions catch (e) {
      emitter(
        VisitingState.errorState(message: e.msgForUser, error: e),
      );
    } on Object catch (e) {
      emitter(
        VisitingState.errorState(
          message: 'Что-то пошло не так, попробуйте позже',
          error: e as Exception,
        ),
      );
      rethrow;
    }

    return null;
  }
}
