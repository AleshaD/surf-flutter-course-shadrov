import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/search_hystory_list_view.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/searched_sights_list_view.dart';
import 'package:places/ui/screen/visiting_screen/widgets/empty_list_page.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'sight_search_screen_wm.dart';

class SightSearchScreenWidget extends ElementaryWidget<ISightSearchScreenWidgetModel> {
  const SightSearchScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultSightSearchScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISightSearchScreenWidgetModel wm) {
    Widget searchIndicator = StateNotifierBuilder<bool>(
      listenableState: wm.inProgres,
      builder: (_, inProgres) {
        return Align(
          alignment: Alignment.topCenter,
          child: inProgres!
              ? LinearProgressIndicator(
                  color: wm.theme.colorScheme.secondary,
                )
              : Container(),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(
          AppStrings.sightListScrAppBar,
        ),
        bottom: SearchBar(
          autoFocus: true,
          controller: wm.searchTxtCtrl,
          onChanged: wm.onSearchBarChanged,
          onEditingComplete: wm.onCompleteSearchEnter,
        ),
      ),
      body: EntityStateNotifierBuilder<SearchScreenType>(
        listenableEntityState: wm.screenType,
        errorBuilder: (_, __, ___) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                searchIndicator,
                NetworkErrorPage(
                  onReloadPressed: wm.onReloadAfterErrorTaped,
                  msgForUser: wm.errorMessage,
                ),
              ],
            ),
          );
        },
        builder: (_, screenType) {
          List<Widget> bodyChildren = [
            searchIndicator,
          ];

          switch (screenType!) {
            case SearchScreenType.searchHystory:
              bodyChildren.add(
                StateNotifierBuilder<Set<String>>(
                  listenableState: wm.queryHistory,
                  builder: (_, hystory) {
                    return SearchHystoryListView(
                      hystory: hystory!,
                      tileTaped: wm.onHysrotyTileTaped,
                      clearHystoryTaped: wm.onClearHystoryTaaped,
                      delHystoryQuery: wm.onDeleteHystoryQueryTaped,
                    );
                  },
                ),
              );
              break;
            case SearchScreenType.searchedSights:
              bodyChildren.add(
                SearchedSightsListView(
                  wm.sights,
                ),
              );
              break;
            case SearchScreenType.emptyPage:
              bodyChildren.add(
                EmptyListPage(
                  icon: CustomIcons.search,
                  titleMessage: '',
                  bodyMessage: '',
                ),
              );
              break;
            case SearchScreenType.noResults:
              bodyChildren.add(
                EmptyListPage(
                  icon: CustomIcons.search,
                  titleMessage: AppStrings.noFindResult,
                  bodyMessage: AppStrings.tryChangeSearchParams,
                ),
              );
              break;
            default:
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: bodyChildren,
            ),
          );
        },
      ),
    );
  }
}
