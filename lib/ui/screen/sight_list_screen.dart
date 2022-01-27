import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
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
        toolbarHeight: toolbarHeight,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: double.infinity,
              ),
              child: Text(
                AppStrings.sightListScrAppBar,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 0; i < sightMocks.length; i++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                height: 48,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: newPlaceBtnRadius,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.secondaryVariant,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: newPlaceBtnRadius,
                          ),
                        ),
                      ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddSightScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CustomIcons.plus,
                          size: 16,
                          color: Theme.of(context).textTheme.button!.color,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          'Новое место'.toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
