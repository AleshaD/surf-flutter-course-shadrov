import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/screen/visiting_screen/widgets/visit_screen_tab_bar.dart';
import 'package:places/ui/screen/visiting_screen/widgets/visited_page.dart';
import 'package:places/ui/screen/visiting_screen/widgets/want_to_visit_page.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';

import '../../../blocs/visiting_bloc/visiting_bloc.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen();

  @override
  State<VisitingScreen> createState() => VisitingScreenState();
}

class VisitingScreenState extends State<VisitingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VisitingBloc>().add(
          VisitingEvent.loadSights(hideLoading: true),
        );
  }

  @override
  Widget build(BuildContext context) {
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
        body: BlocBuilder<VisitingBloc, VisitingState>(
          builder: (context, state) {
            if (state.loadingInProgress) {
              return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              );
            } else if (state.withSights) {
              return TabBarView(
                children: [
                  WantToVisitPage(
                    state.wantToVisitSights,
                  ),
                  VisitedPage(
                    state.visitedSights,
                  ),
                ],
              );
            } else if (state.hasError) {
              return NetworkErrorPage(
                onReloadPressed: () {
                  context.read<VisitingBloc>().add(VisitingEvent.loadSights());
                },
                msgForUser: state.errorMessage,
              );
            }

            throw (Exception(
              'Непредвиденное состояние VisitingBloc на странице VisitingScreen',
            ));
          },
        ),
      ),
    );
  }
}
