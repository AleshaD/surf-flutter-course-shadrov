import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_landscape_orientation.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_portrate_orientation.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_search_bar_delegate.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/widgets/buttons/rounded_gradient_button.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import '../../../data/interactor/sight_interactor.dart';
import '../../../data/model/exceptions/network_exceptions.dart';
import '../../../data/model/sights/sight.dart';
import '../../../store/sight_list/sight_list_screen_store.dart';

class SightListScreen extends StatefulWidget {
  SightListScreen({
    Key? key,
  }) : super(key: key);

  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  final appBarTextSize = 32.0;
  final toolbarHeight = 156.0;
  final newPlaceBtnRadius = BorderRadius.all(
    Radius.circular(24),
  );

  late final StreamSubscription<NetworkExceptions> _networkErrorSubscription;
  String msgErrorForUser = '';
  bool get hasNetworkError => msgErrorForUser.isNotEmpty;

  late final SightListScreenStore _store;

  @override
  void initState() {
    super.initState();
    _networkErrorSubscription = context.read<SightInteractor>().exceptionStream.stream.listen(
          _handleNetworkException,
        );
    final sightRepo = context.read<SightRepository>();
    _store = SightListScreenStore(sightRepo);
    _store.loadSights();
  }

  @override
  void dispose() {
    super.dispose();
    _networkErrorSubscription.cancel();
  }

  void _handleNetworkException(NetworkExceptions exc) {
    setState(() {
      msgErrorForUser = exc.msgForUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (context) {
          final NetworkExceptions? error = _store.networkError;
          final bool isLoading = _store.isLoading;
          final List<Sight> sights = _store.sights;
          final bool showNewPlaceBtn = sights.isNotEmpty;

          return SafeArea(
            child: error != null
                ? NetworkErrorPage(
                    onReloadPressed: () {
                      _store.loadSights();
                    },
                    msgForUser: error.msgForUser,
                  )
                : Stack(
                    children: [
                      if (isLoading)
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
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
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            ),
                          ),
                          SliverPersistentHeader(
                            delegate: SightListSearchBarDelegate(
                              child: SearchBar(
                                readOnly: true,
                                showFilterBtn: true,
                                onFieldTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SightSearchScreen(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          MediaQuery.of(context).orientation == Orientation.portrait
                              ? SightListPortrateOrientation(sights)
                              : SightListLandscapeOrientation(sights)
                        ],
                      ),
                      if (showNewPlaceBtn)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: RoundedGradientButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(
                                      MaterialPageRoute(
                                        builder: (context) => AddSightScreen(),
                                      ),
                                    )
                                    .then((value) => setState(() {}));
                              },
                              titleWidgets: [
                                Icon(
                                  CustomIcons.plus,
                                  size: 16,
                                  color: Theme.of(context).textTheme.button!.color,
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  AppStrings.newPlace.toUpperCase(),
                                  style: Theme.of(context).textTheme.button,
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
