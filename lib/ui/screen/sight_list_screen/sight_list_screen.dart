import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_landscape_orientation.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_portrate_orientation.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_search_bar_delegate.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/widgets/buttons/rounded_gradient_button.dart';
import 'package:places/ui/widgets/search_bar.dart';

import '../../../data/model/sights/sight.dart';

class SightListScreen extends StatefulWidget {
  SightListScreen({
    Key? key,
    required this.sights,
  }) : super(key: key);

  final List<Sight> sights;

  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  final appBarTextSize = 32.0;
  final toolbarHeight = 156.0;
  final newPlaceBtnRadius = BorderRadius.all(
    Radius.circular(24),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                          builder: (context) => SightSearchScreen(
                            searchInteractor: SearchInteractor.instance,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? SightListPortrateOrientation(widget.sights)
                    : SightListLandscapeOrientation(widget.sights)
              ],
            ),
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
      ),
    );
  }
}
