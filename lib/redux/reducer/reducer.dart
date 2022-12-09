import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/reducer/search_reducer.dart';
import 'package:redux/redux.dart';
import 'package:places/redux/state/redux_app_state.dart';

final Reducer<ReduxAppState> reducer = combineReducers<ReduxAppState>([
  TypedReducer<ReduxAppState, GetSightsSearchAction>(getSightsSearchAction),
  TypedReducer<ReduxAppState, ResultSearchAction>(resultSearchAction),
  TypedReducer<ReduxAppState, UserSearchIsEndSearchAction>(userSearchIsEndSearchAction),
  TypedReducer<ReduxAppState, AnErrorHasOccurredSearchAction>(anErrorHasoccurredSearchAction),
  TypedReducer<ReduxAppState, HistoryChangeSearchAction>(historyChangeSearchAction),
]);
