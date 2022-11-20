import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/sight_interactor.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/filters_screen/filter_category.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen();

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  final double _maxSliderRange = SightFilter.maxUntilDist;
  final double _minSliderRange = SightFilter.minFromDist;
  bool _loading = false;
  List<Sight> filteredSights = [];

  SightFilter sightFilter = mockSightFilter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSights();
  }

  void changeActiveCategory(SightType type) {
    if (sightFilter.activeTypes.contains(type)) {
      sightFilter.activeTypes.remove(type);
    } else {
      sightFilter.activeTypes.add(type);
    }
    _loadSights();
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

  String _sightsNumInRange() {
    final int inRange = filteredSights.length;
    return '$inRange';
  }

  Future<void> _loadSights() async {
    setState(() {
      _loading = true;
    });
    try {
      filteredSights = await SightInteractor.instance.getSightsFromFilter(sightFilter);
    } catch (e) {
      filteredSights = [];
    }
    setState(() {
      _loading = false;
    });
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
                    onChangeEnd: (value) {
                      _loadSights();
                    },
                  ),
                ],
              ),
              Spacer(),
              LargeAppButton(
                onPressed: () {
                  _loading ? print('Loading') : print('Показать taped: $filteredSights');
                },
                titleWidgets: [
                  Text(
                    '${AppStrings.show.toUpperCase()} (${_sightsNumInRange()})',
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
