import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/state/redux_app_state.dart';
import 'package:redux/redux.dart';

class SearchMiddleware implements MiddlewareClass<ReduxAppState> {
  final SearchInteractor _searchRepository;

  SearchMiddleware(this._searchRepository);

  @override
  call(Store<ReduxAppState> store, action, NextDispatcher next) {
    if (action is GetSightsSearchAction) {
      _searchRepository.getSightsBy(name: action.query).then(
        (sights) {
          store.dispatch(
            ResultSearchAction(
              sights: sights,
              history: _searchRepository.getSearchHystory(),
              query: action.query,
            ),
          );
        },
      ).catchError(
        (erorr) {
          String msg = AppStrings.unknownError;
          if (erorr is NetworkExceptions) msg = erorr.msgForUser;
          store.dispatch(
            AnErrorHasOccurredSearchAction(errorMsg: msg),
          );
        },
      );
    }

    if (action is GetSearchHistorySearchAction) {
      _dispatchSearchHystory(store);
    }

    if (action is DeleteQuerySearchAction) {
      _searchRepository.removeFromHystory(action.query);
      _dispatchSearchHystory(store);
    }

    if (action is DeleteHistorySearchAction) {
      _searchRepository.cleanHystory();
      _dispatchSearchHystory(store);
    }

    next(action);
  }

  void _dispatchSearchHystory(Store<ReduxAppState> store) {
    store.dispatch(
      HistoryChangeSearchAction(
        history: _searchRepository.getSearchHystory(),
      ),
    );
  }
}
