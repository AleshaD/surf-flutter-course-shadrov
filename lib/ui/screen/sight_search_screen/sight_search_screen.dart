import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/sights/searched_sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_search_screen/search_hystory_list_view.dart';
import 'package:places/ui/screen/sight_search_screen/searched_sights_list_view.dart';
import 'package:places/ui/screen/visiting_screen/empty_list_page.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/search_bar.dart';

enum _SearchScreenType { error, searchHystory, searchedSights, noResults, emptyPage }

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key, required this.searchInteractor}) : super(key: key);

  final SearchInteractor searchInteractor;

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  int enterDelayMs = 1000;
  _SearchScreenType pageState = _SearchScreenType.searchHystory;
  Timer timerToSearch = Timer(Duration.zero, () {});
  TextEditingController _txtController = TextEditingController();
  List<SearchedSight> _findedSights = [];

  final _loadingStreamCtrl = StreamController<bool>();

  @override
  void dispose() {
    super.dispose();
    _txtController.dispose();
    _loadingStreamCtrl.close();
  }

  @override
  void initState() {
    super.initState();
    widget.searchInteractor.getSearchHystory().isNotEmpty
        ? pageState = _SearchScreenType.searchHystory
        : pageState = _SearchScreenType.emptyPage;
  }

  bool pgStateIs(_SearchScreenType type) => pageState == type;

  void setEmptyPgState() => pageState = _SearchScreenType.emptyPage;
  void setSearchedPgState() => pageState = _SearchScreenType.searchedSights;
  void setHystoryPgState() => pageState = _SearchScreenType.searchHystory;
  void setNoResultPgState() => pageState = _SearchScreenType.noResults;
  void setErrorPgState() => pageState = _SearchScreenType.error;

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
    if (query.trim().isEmpty) return;

    _loadingStreamCtrl.sink.add(true);
    setState(() {
      setSearchedPgState();
    });

    try {
      _findedSights = await widget.searchInteractor.getSightsBy(name: query);
      _loadingStreamCtrl.sink.add(false);
      setState(() {
        if (_findedSights.isEmpty) setNoResultPgState();
      });
    } catch (e) {
      _loadingStreamCtrl.sink.add(false);
      setState(() {
        setErrorPgState();
      });
    }
  }

  void onCompleteSearchEnter() {
    timerToSearch.cancel();
    saveSearchedStr();
    doSearch(_txtController.text);
  }

  void saveSearchedStr() {
    String searchedStr = _txtController.text.trim();
    widget.searchInteractor.saveToHystory(searchedStr);
  }

  void showEmptyOrHystoryPg() => setState(() {
        widget.searchInteractor.getSearchHystory().isNotEmpty
            ? setHystoryPgState()
            : setEmptyPgState();
      });

  bool checkFraseInName(String name, String frase) {
    List<String> words = frase.split(' ');
    for (var i = 0; i < words.length; i++) {
      String word = words[i].trim().toLowerCase();
      if (!name.toLowerCase().contains(word)) return false;
    }

    return true;
  }

  Widget getBodyByState() {
    final Set<String> searchHystory = widget.searchInteractor.getSearchHystory();
    switch (pageState) {
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
          _findedSights,
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
        return EmptyListPage(
          icon: CustomIcons.info,
          titleMessage: AppStrings.erorr,
          bodyMessage: AppStrings.tryAganinLater,
        );
      default:
        return Container();
    }
  }

  void _onDeleteHystoryValueTaped(String name) {
    setState(
      () {
        widget.searchInteractor.removeFromHystory(name);
        if (widget.searchInteractor.getSearchHystory().isEmpty) setEmptyPgState();
      },
    );
  }

  void _onClearHystoryTaped() {
    setState(() {
      widget.searchInteractor.cleanHystory();
      setEmptyPgState();
    });
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: StreamBuilder<bool>(
                    stream: _loadingStreamCtrl.stream,
                    initialData: false,
                    builder: (context, snapshot) {
                      final isLoading = snapshot.data!;
                      return isLoading
                          ? LinearProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                            )
                          : Container();
                    }),
              ),
              getBodyByState(),
            ],
          ),
        ));
  }
}
