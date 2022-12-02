import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/model/sights/searched_sight.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();

  String get errorMsg => maybeWhen<String>(
        erorr: (_, __, errorMsg) => errorMsg,
        orElse: () => '',
      );

  bool get hasError => errorMsg.isNotEmpty;

  bool get inProgress => maybeWhen<bool>(
        inProgress: (_, __) => true,
        orElse: () => false,
      );

  String get query => maybeWhen(
        result: (_, __, query) => query,
        orElse: () => '',
      );

  bool get hasQuery => query.isNotEmpty;

  /// Начальное состояние
  const factory SearchState.init({
    @Default([]) List<SearchedSight> sigths,
    @Default({}) Set<String> history,
  }) = _Init;

  /// В процессе загрузки
  const factory SearchState.inProgress({
    @Default([]) List<SearchedSight> sigths,
    @Default({}) Set<String> history,
  }) = _InProgress;

  /// Ошибка при поиске
  const factory SearchState.erorr({
    @Default([]) List<SearchedSight> sigths,
    @Default({}) Set<String> history,
    @Default('Ошибка при поиске') String errorMessage,
  }) = _Erorr;

  /// Поиск выполнен
  const factory SearchState.result({
    @Default([]) List<SearchedSight> sigths,
    @Default({}) Set<String> history,
    @Default('') String query,
  }) = _Result;
}
