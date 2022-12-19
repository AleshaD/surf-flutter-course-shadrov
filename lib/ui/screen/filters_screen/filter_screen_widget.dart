import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/ui/screen/filters_screen/widgets/filter_category.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';
import 'package:places/ui/widgets/error_pages/network_error_page.dart';
import 'filter_screen_wm.dart';

class FilterScreenWidget extends ElementaryWidget<IFilterScreenWidgetModel> {
  const FilterScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = filterScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFilterScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: wm.clearFilterTypes,
              child: Text(
                AppStrings.cleare,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: wm.theme.colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: EntityStateNotifierBuilder<String>(
        listenableEntityState: wm.showBtnTitleStr,
        errorBuilder: (context, e, data) {
          return NetworkErrorPage(
            onReloadPressed: wm.reloadAfterErrorPressed,
            msgForUser: data!,
          );
        },
        builder: (context, showBtnTitle) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StateNotifierBuilder<SightFilter>(
                    listenableState: wm.sightFilter,
                    builder: (_, filter) {
                      return Column(
                        children: [
                          _FilterCategorys(
                            filter: filter!,
                            onCategoryTaped: wm.changeCategory,
                          ),
                          _FilterSlider(
                            filter: filter,
                            sliderReadableDiaposon: wm.sliderReadableDiaposon,
                            theme: wm.theme,
                            onChanged: wm.onSliderChanged,
                            onChangedEnd: wm.onSliderChangeEnd,
                          ),
                        ],
                      );
                    },
                  ),
                  Spacer(),
                  LargeAppButton(
                    isActive: wm.isShowBtnActive,
                    onPressed: wm.showSightsPressed,
                    titleWidgets: [
                      Text(
                        showBtnTitle!,
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
        },
      ),
    );
  }
}

class _FilterCategorys extends StatelessWidget {
  const _FilterCategorys({
    Key? key,
    required this.filter,
    required this.onCategoryTaped,
  }) : super(key: key);

  final SightFilter filter;
  final ValueChanged<SightType> onCategoryTaped;

  Widget _filterCategoryBuilder(SightType type) {
    return FilterCategory(
      type: type,
      isActive: filter.isActiveTypes(type),
      onTap: onCategoryTaped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            _filterCategoryBuilder(SightType.hotel),
            _filterCategoryBuilder(SightType.restaurant),
            _filterCategoryBuilder(SightType.other),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _filterCategoryBuilder(SightType.park),
            _filterCategoryBuilder(SightType.museum),
            _filterCategoryBuilder(SightType.cafe),
          ],
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}

class _FilterSlider extends StatelessWidget {
  const _FilterSlider({
    Key? key,
    required this.filter,
    required this.sliderReadableDiaposon,
    required this.theme,
    required this.onChanged,
    required this.onChangedEnd,
  }) : super(key: key);

  final SightFilter filter;
  final String sliderReadableDiaposon;
  final ThemeData theme;
  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangedEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.distance,
              style: theme.textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              sliderReadableDiaposon,
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
          min: filter.minDist,
          max: filter.maxDist,
          values: filter.getRange,
          onChanged: onChanged,
          onChangeEnd: onChangedEnd,
        ),
      ],
    );
  }
}
