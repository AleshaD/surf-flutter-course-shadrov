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

  List<SightWantToVisit> get visitedSights => when<List<SightWantToVisit>>(
        loadingState: () => [],
        sightsReadyState: (_, sights) => sights,
        sightsUpdatesState: (_, sights) => sights,
        errorState: (_, __) => [],
      );

  List<SightWantToVisit> get wantToVisitSights => when<List<SightWantToVisit>>(
        loadingState: () => [],
        sightsReadyState: (sights, _) => sights,
        sightsUpdatesState: (sights, _) => sights,
        errorState: (_, __) => [],
      );

  bool get isSmallUpdateInProgress => maybeWhen<bool>(
        sightsUpdatesState: (_, __) => true,
        orElse: () => false,
      );

  bool get loadingInProgress => maybeWhen<bool>(
        loadingState: () => true,
        orElse: () => false,
      );

  String get errorMessage => maybeWhen<String>(
        errorState: (error, message) => message,
        orElse: () => '',
      );

  bool get hasError => errorMessage.isNotEmpty;

  bool isSightInWantToVisitList(Sight sight) {
    try {
      wantToVisitSights.firstWhere((s) => s.id == sight.id);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Загрузка мест
  const factory VisitingState.loadingState() = _LoadingState;

  /// Места загружены и готовы к показу
  const factory VisitingState.sightsReadyState({
    required List<SightWantToVisit> wantToVisitSights,
    required List<SightWantToVisit> visitedSights,
  }) = _SightsReadyState;

  /// Идёт обновление мест
  const factory VisitingState.sightsUpdatesState({
    required List<SightWantToVisit> wantToVisitSights,
    required List<SightWantToVisit> visitedSights,
  }) = _SightsUpdatesState;

  /// Ошибка
  const factory VisitingState.errorState({
    Exception? error,
    @Default('При загрузке произошла ошибка') String message,
  }) = _ErrorState;
}
