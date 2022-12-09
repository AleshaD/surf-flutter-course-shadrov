import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/state/redux_app_state.dart';
import 'package:places/redux/state/search_state.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_search_screen/search_hystory_list_view.dart';
import 'package:places/ui/screen/sight_search_screen/searched_sights_list_view.dart';
import 'package:places/ui/screen/visiting_screen/empty_list_page.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';
import 'package:places/ui/widgets/search_bar.dart';

enum _SearchScreenType { error, searchHystory, searchedSights, noResults, emptyPage }

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  int _enterDelayMs = 1000;
  Timer _timerToSearch = Timer(Duration.zero, () {});
  TextEditingController _txtController = TextEditingController();

  bool _searchInProgress = false;

  @override
  void dispose() {
    super.dispose();
    _txtController.dispose();
  }

  void _onSearchBarChanged(String val) {
    _timerToSearch.cancel();
    if (val.trim().isEmpty) {
      _dispatchToStore(UserSearchIsEndSearchAction());

      return;
    }

    // поиск если ввели слово
    if (val.endsWith(' ')) return _doSearch(val);

    // если не вводили символ в течении enterDelay
    _timerToSearch = Timer(
      Duration(milliseconds: _enterDelayMs),
      () => _doSearch(val),
    );
  }

  void _doSearch(String query) async {
    if (query.trim().isEmpty && !_searchInProgress) return;

    _dispatchToStore(GetSightsSearchAction(query: query));
  }

  void _onCompleteSearchEnter() {
    if (_txtController.text.trim().isEmpty) return;
    _timerToSearch.cancel();
    _doSearch(_txtController.text);
  }

  void _onDeleteHystoryValueTaped(String query) => _dispatchToStore(
        DeleteQuerySearchAction(
          query: query,
        ),
      );

  void _onClearHystoryTaped() {
    _dispatchToStore(DeleteHistorySearchAction());
  }

  void _setValueToTxtCtrl(String value) {
    _txtController.value = TextEditingValue(
      text: value,
      selection: TextSelection(
        baseOffset: value.length,
        extentOffset: value.length,
      ),
    );
  }

  void _dispatchToStore(SearchAction action) {
    StoreProvider.of<ReduxAppState>(context).dispatch(action);
  }

  Widget _getBodyByState({
    required _SearchScreenType state,
    required Set<String> searchHystory,
    required List<SearchedSight> sights,
    required String errorMsg,
  }) {
    switch (state) {
      case _SearchScreenType.searchHystory:
        return SearchHystoryListView(
          hystory: searchHystory,
          tileTaped: (searchTxt) {
            _setValueToTxtCtrl(searchTxt);
            _doSearch(searchTxt);
          },
          clearHystoryTaped: _onClearHystoryTaped,
          delHystoryQuery: _onDeleteHystoryValueTaped,
        );
      case _SearchScreenType.searchedSights:
        return SearchedSightsListView(
          sights,
        );
      case _SearchScreenType.emptyPage:
        return EmptyListPage(
          icon: CustomIcons.search,
          titleMessage: '',
          bodyMessage: '',
        );
      case _SearchScreenType.noResults:
        return EmptyListPage(
          icon: CustomIcons.search,
          titleMessage: AppStrings.noFindResult,
          bodyMessage: AppStrings.tryChangeSearchParams,
        );
      case _SearchScreenType.error:
        return NetworkErrorPage(
          onReloadPressed: () => {
            StoreProvider.of<ReduxAppState>(context).dispatch(
              GetSearchHistorySearchAction(),
            )
          },
          msgForUser: errorMsg,
        );
      default:
        return Container();
    }
  }

  _SearchScreenType _currentScreenType = _SearchScreenType.emptyPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(
          AppStrings.sightListScrAppBar,
        ),
        bottom: SearchBar(
          autoFocus: true,
          controller: _txtController,
          onChanged: _onSearchBarChanged,
          onEditingComplete: _onCompleteSearchEnter,
        ),
      ),
      body: StoreConnector<ReduxAppState, SearchState>(
        onInit: (store) => store.dispatch(
          GetSearchHistorySearchAction(),
        ),
        converter: (store) => store.state.searchState,
        builder: (context, vm) {
          _searchInProgress = vm.inProgress;
          _SearchScreenType screenTypeBasedOnVm = _SearchScreenType.emptyPage;
          if (vm.sigths.isNotEmpty) screenTypeBasedOnVm = _SearchScreenType.searchedSights;
          if (vm.sigths.isEmpty && vm.history.isNotEmpty)
            screenTypeBasedOnVm = _SearchScreenType.searchHystory;
          if (vm.sigths.isEmpty && _txtController.text.isNotEmpty)
            screenTypeBasedOnVm = _SearchScreenType.noResults;
          if (vm.hasError) screenTypeBasedOnVm = _SearchScreenType.error;

          if (!_searchInProgress) _currentScreenType = screenTypeBasedOnVm;

          if (_txtController.text.isEmpty && vm.hasQuery) _setValueToTxtCtrl(vm.query);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: _searchInProgress
                      ? LinearProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : Container(),
                ),
                _getBodyByState(
                  state: _currentScreenType,
                  searchHystory: vm.history,
                  sights: vm.sigths,
                  errorMsg: vm.errorMsg,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
