import 'package:places/data/model/sights/searched_sight.dart';

abstract class SearchAction {}

/// Выполнить поиск по местам
class GetSightsSearchAction extends SearchAction {
  GetSightsSearchAction({required this.query});
  final String query;
}

/// Результат поиска мест
class ResultSearchAction extends SearchAction {
  ResultSearchAction({
    required this.sights,
    required this.history,
  });

  final List<SearchedSight> sights;
  final Set<String> history;
}

/// Пользователь окончил поиск
class UserSearchIsEndSearchAction extends SearchAction {}

/// Удалить запрос из истории
class DeleteQuerySearchAction extends SearchAction {
  DeleteQuerySearchAction({required this.query});
  final String query;
}

/// Удалить историю
class DeleteHistorySearchAction extends SearchAction {}

/// Произошла ошибка при загрузке мест
class AnErrorHasOccurredSearchAction extends SearchAction {
  AnErrorHasOccurredSearchAction({required this.errorMsg});
  final String errorMsg;
}

/// Запросить историю поиска
class GetSearchHistorySearchAction extends SearchAction {}

/// История поиска изменилась
class HistoryChangeSearchAction extends SearchAction {
  HistoryChangeSearchAction({required this.history});
  final Set<String> history;
}
