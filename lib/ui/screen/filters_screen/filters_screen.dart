import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:places/domain/coordinate.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/filters_screen/filter_category.dart';
import 'package:places/ui/widgets/large_app_button.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    required this.sights,
    required this.myCoordinate,
  });

  final Coordinate myCoordinate;
  final List<Sight> sights;

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  final double _maxSliderRange = 10000;
  final double _minSliderRange = 0;

  Set<SightType> _activeCategories = {};
  RangeValues _sliderValues = RangeValues(0, 3000);

  void changeActiveCategory(SightType type) {
    setState(() {
      if (_activeCategories.contains(type)) {
        _activeCategories.remove(type);
      } else {
        _activeCategories.add(type);
      }
    });
  }

  String _readableDistanceVal(double val) {
    var m = val.floor();
    if (m < 1000) {
      return '$m м';
    } else {
      double km = m / 1000;

      return '${km.toStringAsFixed(1)} км';
    }
  }

  bool isSightInRange(Sight sight) {
    var ky = 40000 / 360;
    var kx = Math.cos(Math.pi * widget.myCoordinate.lat / 180.0) * ky;
    var dx = (widget.myCoordinate.lon - sight.lon).abs() * kx;
    var dy = (widget.myCoordinate.lat - sight.lat).abs() * ky;
    var distance = Math.sqrt(dx * dx + dy * dy) * 1000;

    return _sliderValues.start <= distance && _sliderValues.end >= distance;
  }

  String sightsNumInRange() {
    int inRange = 0;
    widget.sights.forEach((sight) {
      if (isSightInRange(sight)) inRange++;
    });

    return '$inRange';
  }

  bool isActiveCategory(SightType type) => _activeCategories.contains(type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 18,
          onPressed: () => print('Back btn pressed'),
          icon: Icon(
            CustomIcons.arrow_back,
            size: 14,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () => setState(() {
                _activeCategories.clear();
              }),
              child: Text(
                'Очистить',
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              'КАТЕГОРИИ',
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
                FilterCategory(type: SightType.specialPlace),
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
                      'Расстояние',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'от ${_readableDistanceVal(_sliderValues.start)} до ${_readableDistanceVal(_sliderValues.end)}',
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
                  values: _sliderValues,
                  onChanged: (RangeValues vals) => setState(() {
                    vals.end < 100
                        ? _sliderValues = RangeValues(vals.start, 100)
                        : _sliderValues = vals;
                  }),
                ),
              ],
            ),
            Spacer(),
            LargeAppButton(
              onPressed: () => print('Показать taped'),
              titleWidgets: [
                Text(
                  'ПОКАЗАТЬ (${sightsNumInRange()})',
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
