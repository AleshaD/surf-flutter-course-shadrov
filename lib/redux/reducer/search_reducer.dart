import 'package:places/redux/action/search_action.dart';

import '../state/app_state.dart';
import '../state/search_state.dart';

ReduxAppState getSightsSearchAction(ReduxAppState state, GetSightsSearchAction action) {
  return state.cloneWith(
    searchState: SearchState.inProgress(
      sigths: state.searchState.sigths,
      history: state.searchState.history,
    ),
  );
}

ReduxAppState resultSearchAction(ReduxAppState state, ResultSearchAction action) {
  return state.cloneWith(
    searchState: SearchState.result(
      sigths: action.sights,
      history: action.history,
    ),
  );
}

ReduxAppState userSearchIsEndSearchAction(ReduxAppState state, UserSearchIsEndSearchAction action) {
  return state.cloneWith(
    searchState: SearchState.result(
      sigths: [],
      history: state.searchState.history,
    ),
  );
}

ReduxAppState getSearchHistory(ReduxAppState state, GetSearchHistorySearchAction action) {
  return state;
}

ReduxAppState deleteQuerySearchAction(ReduxAppState state, DeleteQuerySearchAction action) {
  return state;
}

ReduxAppState deleteHistorySearchAction(ReduxAppState state, DeleteHistorySearchAction action) {
  return state;
}

ReduxAppState anErrorHasoccurredSearchAction(ReduxAppState state, AnErrorHasOccurredSearchAction action) {
  return state.cloneWith(
    searchState: SearchState.erorr(
      sigths: state.searchState.sigths,
      history: state.searchState.history,
      errorMessage: action.errorMsg,
    ),
  );
}

ReduxAppState historyChangeSearchAction(ReduxAppState state, HistoryChangeSearchAction action) {
  return state.cloneWith(
    searchState: SearchState.result(
      sigths: state.searchState.sigths,
      history: action.history,
    ),
  );
}
