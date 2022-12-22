import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_want_to_visit.dart';

part 'visiting_event.dart';
part 'visiting_state.dart';
part 'visiting_bloc.freezed.dart';

class VisitingBloc extends Bloc<VisitingEvent, VisitingState> {
  VisitingBloc({required SightRepository sightRepository})
      : _sightRepository = sightRepository,
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
    _sightRepository.initedFavotireAndVisitedSights.then((isSuccess) {
      if (isSuccess) this.add(VisitingEvent.loadSights());
    });
  }

  // Назвал репозиторием, поскольку мой интерактор по факту выполняет эту функцию
  // а то что сейчас называется репозиторием это просто api сервера.
  // в конце этого раздела по архитектуре планирую сделать рефакторинг, чтобы лучше разделить
  // слой данных, управления данными, слой бизнесс логики и интерфейса
  final SightRepository _sightRepository;

  _loadSights(_LoadSights event, Emitter<VisitingState> emitter) async {
    if (!event.hideLoading) {
      emitter(VisitingState.loadingState());
      await Future.delayed(Duration(seconds: 5));
    }

    final List<SightWantToVisit> visitedSights = _sightRepository.getVisitedSights();
    final List<SightWantToVisit> wantToVisitSights = _sightRepository.getFavoriteSights();

    emitter(VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights], visitedSights: [...visitedSights]));
  }

  Future<void> _addWantToVisitTime(
      _AddWantToVisitTime event, Emitter<VisitingState> emitter) async {
    final wantToVisitSights = _sightRepository.addWantToVisitSightWithDate(
      event.sight,
      event.date,
    );

    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights],
        visitedSights: state.visitedSights,
      ),
    );
  }

  Future<void> _changeVisitedCardsSequences(
      _ChangeVisitedCardsSequences event, Emitter<VisitingState> emitter) async {
    final visitedSights =
        _sightRepository.changeVisitedCardsSequences(event.fromIndex, event.toIndex);
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: state.wantToVisitSights,
        visitedSights: [...visitedSights],
      ),
    );
  }

  Future<void> _changeWantToVisitCardsSequences(
      _ChangeWantToVisitCardsSequences event, Emitter<VisitingState> emitter) async {
    final wantToVisitSights =
        _sightRepository.changeWantToVisitCardsSequences(event.fromIndex, event.toIndex);
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights],
        visitedSights: state.visitedSights,
      ),
    );
  }

  Future<void> _deleteFromVisited(
      _DeleteFromVisited event, Emitter<VisitingState> emitter) async {
    _sightRepository.removeFromVisited(event.sight);
    final visitedSights = _sightRepository.getVisitedSights();
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
    _sightRepository.removeFromFavorites(event.sight);
    final wantToVisitSights = _sightRepository.getFavoriteSights();
    emitter(
      VisitingState.sightsReadyState(
        wantToVisitSights: [...wantToVisitSights],
        visitedSights: state.visitedSights,
      ),
    );
  }

  Future<void> _addToWantToVisit(
      _AddToWantToVisit event, Emitter<VisitingState> emitter) async {
    _sightRepository.addToFavorite(event.sight);
    final wantToVisitSights = _sightRepository.getFavoriteSights();
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
