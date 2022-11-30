part of 'visiting_bloc.dart';

@freezed
class VisitingState with _$VisitingState {
  const VisitingState._();

  bool get withSights => when<bool>(
        loadingState: () => false,
        sightsReadyState: (_, __) => true,
        sightsUpdatesState: (_, __) => true,
        errorState: (_, __) => false,
      );

  List<Sight> get visitedSights => when<List<Sight>>(
        loadingState: () => [],
        sightsReadyState: (_, sights) => sights,
        sightsUpdatesState: (_, sights) => sights,
        errorState: (_, __) => [],
      );

  List<Sight> get wantToVisitSights => when<List<Sight>>(
        loadingState: () => [],
        sightsReadyState: (sights, _) => sights,
        sightsUpdatesState: (sights, _) => sights,
        errorState: (_, __) => [],
      );

  /// Загрузка мест
  const factory VisitingState.loadingState() = _LoadingState;

  /// Места загружены и готовы к показу
  const factory VisitingState.sightsReadyState({
    required List<Sight> wantToVisitSights,
    required List<Sight> visitedSights,
  }) = _SightsReadyState;

  /// Идёт обновление мест
  const factory VisitingState.sightsUpdatesState({
    required List<Sight> wantToVisitSights,
    required List<Sight> visitedSights,
  }) = _LoadinState;

  /// Ошибка
  const factory VisitingState.errorState({
    Exception? error,
    @Default('При загрузке произошла ошибка') String message,
  }) = _ErrorState;
}
