import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/enums/search_screen_state_type.dart';
import 'package:places/domain/sight_filter.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/visiting_screen/empty_list_page.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/search_bar.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  SearchScreenType pageState = SearchScreenType.searchHystory;
  List<String> searchHystory = ['Привет', 'Кафе', '78'];
  SightFilter sightFilter = mockSightFilter;

  @override
  void initState() {
    super.initState();
    searchHystory.isNotEmpty
        ? pageState = SearchScreenType.searchHystory
        : pageState = SearchScreenType.emptyPage;
  }

  bool pgStateIs(SearchScreenType type) => pageState == type;

  void setEmptyPgState() => pageState = SearchScreenType.emptyPage;

  Widget getBodyByState() {
    switch (pageState) {
      case SearchScreenType.searchHystory:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                AppStrings.youSearched.toUpperCase(),
                style: Theme.of(context).textTheme.caption,
              ),
              for (var i = 0; i < searchHystory.length; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 48,
                      child: ListTile(
                        onTap: () {},
                        dense: true,
                        contentPadding: const EdgeInsets.only(left: 0, right: 16),
                        leading: Text(
                          searchHystory[i],
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontSize: 16,
                                height: 1,
                              ),
                        ),
                        trailing: IconButton(
                          onPressed: () => setState(() {
                            searchHystory.removeAt(i);
                            if (searchHystory.isEmpty) setEmptyPgState();
                          }),
                          splashRadius: 20,
                          icon: Icon(
                            CustomIcons.close,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    i != searchHystory.length - 1 ? Divider() : Container()
                  ],
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
          ),
        );
      case SearchScreenType.searchedSights:
        return Container();
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
          ),
        ),
        body: getBodyByState());
  }
}
