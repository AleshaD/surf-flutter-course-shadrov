import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/screen/visiting_screen/widgets/visit_screen_tab_bar.dart';
import 'package:places/ui/screen/visiting_screen/widgets/visited_page.dart';
import 'package:places/ui/screen/visiting_screen/widgets/want_to_visit_page.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';
import 'visiting_screen_wm.dart';

class VisitingScreenWidget extends ElementaryWidget<IVisitingScreenWidgetModel> {
  const VisitingScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = visitingScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IVisitingScreenWidgetModel wm) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              AppStrings.favorites,
            ),
          ),
          bottom: VisitScreenTabBar(
            tabs: [
              Tab(text: AppStrings.wantToGo),
              Tab(text: AppStrings.visited),
            ],
          ),
        ),
        body: EntityStateNotifierBuilder<VisitingState>(
          listenableEntityState: wm.visitingState,
          errorBuilder: (_, __, state) {
            return NetworkErrorPage(
              onReloadPressed: wm.onReloadAfterError,
              msgForUser: state!.errorMessage,
            );
          },
          loadingBuilder: (_, __) {
            return Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: wm.theme.colorScheme.onBackground,
              ),
            );
          },
          builder: (context, state) {
            return TabBarView(
              children: [
                WantToVisitPage(
                  state!.wantToVisitSights,
                ),
                VisitedPage(
                  state.visitedSights,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
