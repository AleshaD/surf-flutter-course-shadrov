import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/state/app_state.dart';
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
            SearchAction.resultSearchAction(
              sights: sights,
              history: _searchRepository.getSearchHystory(),
            ),
          );
        },
      ).catchError(
        (erorr) {
          String msg = 'Непредвиденная ошибка';
          if (erorr is NetworkExceptions) msg = erorr.msgForUser;
          store.dispatch(
            SearchAction.anErrorHasoccurred(errorMsg: msg),
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

    if (action is DeleteQuerySearchAction) {
      _searchRepository.cleanHystory();
      _dispatchSearchHystory(store);
    }
  }

  void _dispatchSearchHystory(Store<ReduxAppState> store) {
    store.dispatch(
      SearchAction.historyChange(
        history: _searchRepository.getSearchHystory(),
      ),
    );
  }
}
