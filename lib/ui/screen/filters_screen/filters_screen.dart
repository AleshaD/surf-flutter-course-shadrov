import 'package:flutter/material.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/filters_screen/filter_category.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  Set<SightType> _activeCategories = {};

  void changeActiveCategory(SightType type) {
    setState(() {
      if (_activeCategories.contains(type)) {
        _activeCategories.remove(type);
      } else {
        _activeCategories.add(type);
      }
    });
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
