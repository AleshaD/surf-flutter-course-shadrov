part of 'visiting_bloc.dart';

@freezed
class VisitingEvent with _$VisitingEvent {
  /// Загрузить места
  const factory VisitingEvent.loadSights({@Default(false) bool hideLoading}) = _LoadSights;

  /// Удалить из посещённых
  const factory VisitingEvent.deleteFromVisited({required Sight sight}) = _DeleteFromVisited;

  /// Удалить из тех что хочется посетить
  const factory VisitingEvent.deleteFromWantToVisit({required Sight sight}) =
      _DeleteFromWantToVisit;

  /// Изменить порядок кароточек мест которые псетил
  const factory VisitingEvent.changeVisitedCardsSequences(
      {required int fromIndex, required int toIndex}) = _ChangeVisitedCardsSequences;

  /// Изменить порядок кароточек мест которые хочешь посетить
  const factory VisitingEvent.changeWantToVisitCardsSequences(
      {required int fromIndex, required int toIndex}) = _ChangeWantToVisitCardsSequences;

  /// Добавить/изменить время к тому месту которое хочешь посетить
  const factory VisitingEvent.addWantToVisitTime({required Sight sight, required DateTime date}) =
      _AddWantToVisitTime;

  /// Добавить/изменить время к тому месту которое хочешь посетить
  const factory VisitingEvent.addToWantToVisit({required Sight sight}) =
      _AddToWantToVisit;
}
