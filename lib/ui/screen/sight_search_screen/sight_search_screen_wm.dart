import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/data/repository/search_repository.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:provider/provider.dart';
import 'sight_search_screen_model.dart';
import 'sight_search_screen_widget.dart';

enum SearchScreenType { searchHystory, searchedSights, noResults, emptyPage }

abstract class ISightSearchScreenWidgetModel extends IWidgetModel {
  ThemeData get theme;
  EntityStateNotifier<SearchScreenType> get screenType;
  TextEditingController get searchTxtCtrl;
  StateNotifier<bool> get inProgres;
  StateNotifier<Set<String>> get queryHistory;
  List<SearchedSight> get sights;
  String get errorMessage;

  void onSearchBarChanged(String val);
  void onCompleteSearchEnter();
  void onHysrotyTileTaped(String val);
  void onClearHystoryTaaped();
  void onDeleteHystoryQueryTaped(String query);
  void onReloadAfterErrorTaped();
}

SightSearchScreenWidgetModel defaultSightSearchScreenWidgetModelFactory(
    BuildContext context) {
  return SightSearchScreenWidgetModel(
    SightSearchScreenModel(
      context.read<DefaultErrorHandler>(),
      context.read<SearchRepository>(),
    ),
  );
}

class SightSearchScreenWidgetModel
    extends WidgetModel<SightSearchScreenWidget, SightSearchScreenModel>
    implements ISightSearchScreenWidgetModel {
  SightSearchScreenWidgetModel(
    SightSearchScreenModel model,
  ) : super(model);

  final _screenType = EntityStateNotifier<SearchScreenType>(
      EntityState(data: SearchScreenType.emptyPage));
  final _inProgres = StateNotifier<bool>(initValue: false);
  final TextEditingController _searchTxtCtrl = TextEditingController();
  List<SearchedSight> _sights = [];
  String _errorMsg = '';
  final _queryHistory = StateNotifier<Set<String>>(initValue: {});
  Timer _timerToSearch = Timer(Duration.zero, () {});
  final _enterDelayMs = 1000;

  late StreamSubscription _hystorySubscription;

  @override
  String get errorMessage => _errorMsg;

  @override
  StateNotifier<bool> get inProgres => _inProgres;

  @override
  StateNotifier<Set<String>> get queryHistory => _queryHistory;

  @override
  EntityStateNotifier<SearchScreenType> get screenType => _screenType;

  @override
  TextEditingController get searchTxtCtrl => _searchTxtCtrl;

  @override
  List<SearchedSight> get sights => _sights;

  @override
  ThemeData get theme => Theme.of(context);

  @override
  void onCompleteSearchEnter() {
    _doSearch(_searchTxtCtrl.value.text);
  }

  @override
  void onClearHystoryTaaped() {
    model.deleteAllHistory();
  }

  @override
  void onDeleteHystoryQueryTaped(String query) {
    model.removeFromHistory(query);
  }

  @override
  void onHysrotyTileTaped(String query) {
    _doSearch(query);
  }

  @override
  void onReloadAfterErrorTaped() {}

  @override
  void onSearchBarChanged(String val) {
    _timerToSearch.cancel();
    if (val.trim().isEmpty) {
      _searchIsEnd();

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

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _hystorySubscription = model.historyOfQueryStream.listen((hystory) {
      _queryHistory.accept({...hystory});
      if (_queryHistory.value!.isEmpty &&
          _screenType.value!.data == SearchScreenType.searchHystory) {
        _screenType.content(SearchScreenType.emptyPage);
      }
    });

    final hystory = model.getSearchHistory();
    _queryHistory.accept({...hystory});
    _showEmptyPageOrHystory();
  }

  @override
  void dispose() {
    _hystorySubscription.cancel();
    super.dispose();
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);
    error is NetworkExceptions
        ? _errorMsg = error.msgForUser
        : _errorMsg = AppStrings.unknownError;
    _screenType.error();
  }

  void _doSearch(String query) async {
    if (query.trim().isEmpty && !_inProgres.value!) return;

    _showProgresBar(true);
    _sights = await model.getSightsBy(query: query);
    _screenType.content(
      _sights.isNotEmpty ? SearchScreenType.searchedSights : SearchScreenType.noResults,
    );
    _showProgresBar(false);
  }

  void _searchIsEnd() {
    _showEmptyPageOrHystory();
  }

  void _showEmptyPageOrHystory() {
    _screenType.content(
      _queryHistory.value!.isNotEmpty
          ? SearchScreenType.searchHystory
          : SearchScreenType.emptyPage,
    );
  }

  void _showProgresBar(bool isNeedToShow) {
    _inProgres.accept(isNeedToShow);
  }
}
