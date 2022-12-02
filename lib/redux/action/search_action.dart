import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/model/sights/searched_sight.dart';

part 'search_action.freezed.dart';

@freezed
class SearchAction with _$SearchAction {
  /// Выполнить поиск по местам
  const factory SearchAction.getSightsSearchAction({required String query}) = GetSightsSearchAction;

  /// Результат поиска мест
  const factory SearchAction.resultSearchAction({
    required List<SearchedSight> sights,
    required Set<String> history,
  }) = ResultSearchAction;

  /// Удалить запрос из истории
  const factory SearchAction.deleteQuerySearchAction({required String query}) =
      DeleteQuerySearchAction;

  /// Удалить историю
  const factory SearchAction.deleteHistorySearchAction() = DeleteHistorySearchAction;

  /// Произошла ошибка при загрузке мест
  const factory SearchAction.anErrorHasoccurred({required String errorMsg}) =
      AnErrorHasoccurredSearchAction;

  /// Запросить историю поиска
  const factory SearchAction.getSearchHistory() =
      GetSearchHistorySearchAction;

  /// История поиска изменилась
  const factory SearchAction.historyChange({required Set<String> history}) =
      HistoryChangeSearchAction;

}
