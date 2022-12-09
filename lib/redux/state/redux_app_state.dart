import 'package:places/redux/state/search_state.dart';

class ReduxAppState {
  final SearchState searchState;

  ReduxAppState({
    SearchState? searchState,
  }) : this.searchState = searchState ?? SearchState.init();

  ReduxAppState cloneWith({
    SearchState? searchState,
  }) =>
      ReduxAppState(
        searchState: searchState ?? this.searchState,
      );
}
