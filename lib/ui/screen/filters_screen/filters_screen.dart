import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/sight_filter.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/filters_screen/filter_category.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen();

  final Coordinate myCoordinate = myCoordinateMock;
  final List<Place> sights = sightMocks;

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  final double _maxSliderRange = SightFilter.maxUntilDist;
  final double _minSliderRange = SightFilter.minFromDist;

  /// пока не прошли сохранение данных изменяем глобальный мок объект
  SightFilter sightFilter = mockSightFilter;

  void changeActiveCategory(SightType type) {
    setState(() {
      if (sightFilter.activeTypes.contains(type)) {
        sightFilter.activeTypes.remove(type);
      } else {
        sightFilter.activeTypes.add(type);
      }
    });
  }

  String _readableDistanceVal(double val) {
    var m = val.floor();
    if (m < 1000) {
      return '$m м';
    } else {
      double km = m / 1000;

      return '${km.toStringAsFixed(1)} ${AppStrings.km.toLowerCase()}';
    }
  }

  String sightsNumInRange() {
    int inRange = 0;
    widget.sights.forEach((sight) {
      if (sightFilter.sightInFilter(sight, widget.myCoordinate)) inRange++;
    });

    return '$inRange';
  }

  bool isActiveCategory(SightType type) => sightFilter.activeTypes.contains(type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () => setState(() {
                sightFilter.activeTypes.clear();
              }),
              child: Text(
                AppStrings.cleare,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                AppStrings.categoryes.toUpperCase(),
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterCategory(type: SightType.hotel),
                  FilterCategory(type: SightType.restaurant),
                  FilterCategory(type: SightType.other),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterCategory(type: SightType.park),
                  FilterCategory(type: SightType.museum),
                  FilterCategory(type: SightType.cafe),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.distance,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '${AppStrings.from.toLowerCase()} ${_readableDistanceVal(sightFilter.fromDist)} ${AppStrings.to.toLowerCase()} ${_readableDistanceVal(sightFilter.toDist)}',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 16,
                            ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  RangeSlider(
                    min: _minSliderRange,
                    max: _maxSliderRange,
                    values: sightFilter.getRange,
                    onChanged: (RangeValues vals) => setState(() {
                      vals.end < 100
                          ? sightFilter.setByRange(RangeValues(vals.start, 100))
                          : sightFilter.setByRange(vals);
                    }),
                  ),
                ],
              ),
              Spacer(),
              LargeAppButton(
                onPressed: () => print('Показать taped'),
                titleWidgets: [
                  Text(
                    '${AppStrings.show.toUpperCase()} (${sightsNumInRange()})',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
