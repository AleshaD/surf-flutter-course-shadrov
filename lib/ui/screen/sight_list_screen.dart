import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:places/ui/widgets/buttons/rounded_gradient_button.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:places/ui/widgets/sight_cards/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final appBarTextSize = 32.0;
  final toolbarHeight = 156.0;
  final newPlaceBtnRadius = BorderRadius.all(
    Radius.circular(24),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          AppStrings.sightListScrAppBar,
        ),
        bottom: SearchBar(
          readOnly: true,
          showFilterBtn: true,
          onFieldTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SightSearchScreen(),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < sightMocks.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SightCard(
                        sightMocks[i],
                      ),
                    ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: RoundedGradientButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddSightScreen(),
                    ),
                  );
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
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
