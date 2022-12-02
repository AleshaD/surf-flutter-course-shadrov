import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/redux/state/search_state.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_search_screen/search_hystory_list_view.dart';
import 'package:places/ui/screen/sight_search_screen/searched_sights_list_view.dart';
import 'package:places/ui/screen/visiting_screen/empty_list_page.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:provider/provider.dart';

enum _SearchScreenType { error, searchHystory, searchedSights, noResults, emptyPage }

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  int enterDelayMs = 1000;
  _SearchScreenType pageState = _SearchScreenType.searchHystory;
  Timer timerToSearch = Timer(Duration.zero, () {});
  TextEditingController _txtController = TextEditingController();
  List<SearchedSight> _findedSights = [];
  String _networkErrorMsg = '';

  bool _searchInProgress = false;
  final _loadingStreamCtrl = StreamController<bool>.broadcast();
  final _screenStateStreamCtrl = StreamController<_SearchScreenType>();

  @override
  void dispose() {
    super.dispose();
    _txtController.dispose();
    _loadingStreamCtrl.close();
    _screenStateStreamCtrl.close();
  }

  @override
  void initState() {
    super.initState();
    showEmptyOrHystoryPg();
    _loadingStreamCtrl.stream.listen((isLoading) {
      _searchInProgress = isLoading;
    });
  }

  bool pgStateIs(_SearchScreenType type) => pageState == type;

  void setEmptyPgState() => _screenStateStreamCtrl.sink.add(_SearchScreenType.emptyPage);
  void setSearchedPgState() => _screenStateStreamCtrl.sink.add(_SearchScreenType.searchedSights);
  void setHystoryPgState() => _screenStateStreamCtrl.sink.add(_SearchScreenType.searchHystory);
  void setNoResultPgState() => _screenStateStreamCtrl.sink.add(_SearchScreenType.noResults);
  void setErrorPgState() => _screenStateStreamCtrl.sink.add(_SearchScreenType.error);

  void onSearchBarChanged(String val) {
    timerToSearch.cancel();
    if (val.trim().isEmpty) return showEmptyOrHystoryPg();

    // поиск если ввели слово
    if (val.endsWith(' ')) return doSearch(val);

    // если не вводили символ в течении enterDelay
    timerToSearch = Timer(
      Duration(milliseconds: enterDelayMs),
      () => doSearch(val),
    );
  }

  void doSearch(String query) async {
    if (query.trim().isEmpty && !_searchInProgress) return;

    _loadingStreamCtrl.sink.add(true);

    try {
      _findedSights = await context.read<SearchInteractor>().getSightsBy(name: query);
      _loadingStreamCtrl.sink.add(false);
      if (_findedSights.isNotEmpty)
        setSearchedPgState();
      else
        setNoResultPgState();
    } on NetworkExceptions catch (e) {
      _loadingStreamCtrl.sink.add(false);
      _networkErrorMsg = e.msgForUser;
      setErrorPgState();
    } catch (e) {
      rethrow;
    }
  }

  void onCompleteSearchEnter() {
    if (_txtController.text.trim().isEmpty) return;
    timerToSearch.cancel();
    saveSearchedStr();
    doSearch(_txtController.text);
  }

  void saveSearchedStr() {
    String searchedStr = _txtController.text.trim();
    context.read<SearchInteractor>().saveQueryNameToHystory(searchedStr);
  }

  void showEmptyOrHystoryPg() {
    context.read<SearchInteractor>().getSearchHystory().isNotEmpty
        ? setHystoryPgState()
        : setEmptyPgState();
  }

  void _onDeleteHystoryValueTaped(String name) {
    setState(
      () {
        context.read<SearchInteractor>().removeFromHystory(name);
        if (context.read<SearchInteractor>().getSearchHystory().isEmpty) setEmptyPgState();
      },
    );
  }

  void _onClearHystoryTaped() {
    context.read<SearchInteractor>().cleanHystory();
    setEmptyPgState();
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
            _txtController.value = TextEditingValue(
              text: searchTxt,
              selection: TextSelection(
                baseOffset: searchTxt.length,
                extentOffset: searchTxt.length,
              ),
            );
            doSearch(searchTxt);
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
          onReloadPressed: () => showEmptyOrHystoryPg(),
          msgForUser: errorMsg,
        );
      default:
        return Container();
    }
  }

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
          onChanged: onSearchBarChanged,
          onEditingComplete: onCompleteSearchEnter,
          onFocusDismiss: saveSearchedStr,
        ),
      ),
      body: StoreConnector<ReduxAppState, SearchState>(
        onInit: (store) => store.dispatch(
          SearchAction.getSearchHistory(),
        ),
        converter: (store) => store.state.searchState,
        builder: (context, vm) {
          bool isLoading = vm.inProgress;
          late _SearchScreenType currenScreenType;
          if (vm.hasError) currenScreenType = _SearchScreenType.error;
          if (vm.sigths.isNotEmpty) currenScreenType = _SearchScreenType.searchedSights;
          if (vm.sigths.isEmpty && vm.history.isNotEmpty)
            currenScreenType = _SearchScreenType.searchHystory;
          if (vm.sigths.isEmpty && vm.history.isEmpty)
            currenScreenType = _SearchScreenType.emptyPage;
          if (vm.sigths.isEmpty && _txtController.text.isNotEmpty)
            currenScreenType = _SearchScreenType.noResults;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: isLoading
                      ? LinearProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : Container(),
                ),
                _getBodyByState(
                  state: currenScreenType,
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
