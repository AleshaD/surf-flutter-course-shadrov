import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sight_list_landscape_orientation.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sight_list_portrate_orientation.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sight_list_search_bar_delegate.dart';
import 'package:places/ui/widgets/buttons/rounded_gradient_button.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'sight_list_screen_wm.dart';

class SightListScreenWidget extends ElementaryWidget<ISightListScreenWidgetModel> {
  const SightListScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = sightListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISightListScreenWidgetModel wm) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: EntityStateNotifierBuilder<List<Sight>>(
        listenableEntityState: wm.sights,
        errorBuilder: (_, __, ___) {
          return NetworkErrorPage(
            onReloadPressed: wm.onErrorReloadTaped,
            msgForUser: wm.errorMsg,
          );
        },
        loadingBuilder: (_, __) {
          return Center(
            child: CircularProgressIndicator(
              color: wm.theme.colorScheme.onBackground,
            ),
          );
        },
        builder: (_, sights) {
          return SafeArea(
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 134,
                      collapsedHeight: 56,
                      centerTitle: true,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          AppStrings.sightListScrAppBar,
                          style: wm.theme.textTheme.headline5,
                        ),
                        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: SightListSearchBarDelegate(
                        child: SearchBar(
                          readOnly: true,
                          showFilterBtn: true,
                          onFieldTap: wm.onSearchBarTaped,
                        ),
                      ),
                    ),
                    wm.isPortraitOrientation
                        ? SightListPortrateOrientation(sights!)
                        : SightListLandscapeOrientation(sights!)
                  ],
                ),
                if (wm.showNewPlaceBtn)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: RoundedGradientButton(
                        onPressed: wm.onNewPlaceTaped,
                        titleWidgets: [
                          Icon(
                            CustomIcons.plus,
                            size: 16,
                            color: wm.theme.textTheme.button!.color,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            AppStrings.newPlace.toUpperCase(),
                            style: wm.theme.textTheme.button,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
