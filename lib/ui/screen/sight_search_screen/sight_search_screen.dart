import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/enums/search_screen_state_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_filter.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_search_screen/search_hystory_tile.dart';
import 'package:places/ui/screen/sight_search_screen/sight_card_tile.dart';
import 'package:places/ui/screen/visiting_screen/empty_list_page.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/search_bar.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  int enterDelayMs = 1000;
  SearchScreenType pageState = SearchScreenType.searchHystory;
  Set<String> searchHystory = {'Привет', 'Кафе', '78'};
  String searchedString = '';
  SightFilter sightFilter = mockSightFilter;
  Timer timerToSearch = Timer(Duration.zero, () {});
  TextEditingController txtController = TextEditingController();
  bool searchInProgres = false;
  List<Sight> findedSights = [];

  @override
  void dispose() {
    super.dispose();
    txtController.dispose();
  }

  @override
  void initState() {
    super.initState();
    searchHystory.isNotEmpty
        ? pageState = SearchScreenType.searchHystory
        : pageState = SearchScreenType.emptyPage;
  }

  bool pgStateIs(SearchScreenType type) => pageState == type;

  void setEmptyPgState() => pageState = SearchScreenType.emptyPage;
  void setSearchedPgState() => pageState = SearchScreenType.searchedSights;
  void setHystoryPgState() => pageState = SearchScreenType.searchHystory;
  void setNoResultPgState() => pageState = SearchScreenType.noResults;

  void onSearchBarChanged(String val) {
    timerToSearch.cancel();
    if (txtController.text.isEmpty) return showEmptyOrHystoryPg();

    // поиск если ввели слово
    if (txtController.text.endsWith(' ')) return doSearch(txtController.text);

    // если не вводили символ в течении enterDelay
    timerToSearch = Timer(
      Duration(milliseconds: enterDelayMs),
      () => doSearch(txtController.text),
    );
  }

  void doSearch(String query) async {
    setState(() {
      setSearchedPgState();
      searchInProgres = true;
      findedSights.clear();
    });

    Future.delayed(
      // имитация загрузки
      Duration(milliseconds: 1500),
      () => setState(
        () {
          for (var i = 0; i < sightMocks.length; i++) {
            Sight sight = sightMocks[i];
            if (sightFilter.sightInFilter(sight, myCoordinateMock) &&
                checkFraseInName(sight.name, query)) {
              findedSights.add(sight);
            }
          }
          searchInProgres = false;
          if (findedSights.isEmpty) setNoResultPgState();
        },
      ),
    );
  }

  void onCompleteSearchEnter() {
    timerToSearch.cancel();
    saveSearchedStr();
    doSearch(txtController.text);
  }

  void saveSearchedStr() {
    String searchedStr = txtController.text.trim();
    if (searchedStr.isNotEmpty) searchHystory.add(txtController.text.trim());
  }

  void showEmptyOrHystoryPg() => setState(() {
        searchHystory.isNotEmpty ? setHystoryPgState() : setEmptyPgState();
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
    switch (pageState) {
      case SearchScreenType.searchHystory:
        return ListView(
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              AppStrings.youSearched.toUpperCase(),
              style: Theme.of(context).textTheme.caption,
            ),
            for (var i = 0; i < searchHystory.length; i++)
              SearchHystoryTile(
                name: searchHystory.elementAt(i),
                showDevider: i != searchHystory.length - 1,
                tileTaped: () {
                  String searchTxt = searchHystory.elementAt(i) + ' ';
                  txtController.value = TextEditingValue(
                    text: searchTxt,
                    selection: TextSelection(
                      baseOffset: searchTxt.length,
                      extentOffset: searchTxt.length,
                    ),
                  );
                  doSearch(searchTxt);
                },
                onDelBtnPressed: () => setState(
                  () {
                    searchHystory.remove(searchHystory.elementAt(i));
                    if (searchHystory.isEmpty) setEmptyPgState();
                  },
                ),
              ),
            TextButton(
              onPressed: () => setState(() {
                searchHystory.clear();
                setEmptyPgState();
              }),
              child: Text(
                AppStrings.cleanHystory,
              ),
            ),
          ],
        );
      case SearchScreenType.searchedSights:
        return ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            for (var i = 0; i < findedSights.length; i++)
              SightCardTile(
                sight: findedSights[i],
                showDevider: i != findedSights.length - 1,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SightDetailsScreen(findedSights[i]),
                  ),
                ),
              )
          ],
        );
      case SearchScreenType.emptyPage:
        return EmptyListPage(
          icon: CustomIcons.search,
          titleMessage: '',
          bodyMessage: '',
        );
      case SearchScreenType.noResults:
        return EmptyListPage(
          icon: CustomIcons.search,
          titleMessage: AppStrings.noFindResult,
          bodyMessage: AppStrings.tryChangeSearchParams,
        );
      case SearchScreenType.error:
        return EmptyListPage(
          icon: CustomIcons.info,
          titleMessage: AppStrings.erorr,
          bodyMessage: AppStrings.tryAganinLater,
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
            controller: txtController,
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
                child: searchInProgres
                    ? LinearProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : Container(),
              ),
              getBodyByState(),
            ],
          ),
        ));
  }
}
