import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/ui/screen/searched_sights_screen/searched_sights_screen.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:provider/provider.dart';
import 'filter_screen_model.dart';
import 'filter_screen_widget.dart';

abstract class IFilterScreenWidgetModel extends IWidgetModel {
  StateNotifier<SightFilter> get sightFilter;

  EntityStateNotifier<String> get showBtnTitleStr;

  bool get isShowBtnActive;

  ThemeData get theme;

  String get sliderReadableDiaposon;

  void clearFilterTypes();

  void reloadAfterErrorPressed();

  void changeCategory(SightType type);

  void onSliderChanged(RangeValues vals);

  void onSliderChangeEnd(RangeValues vals);

  void showSightsPressed();
}

FilterScreenWidgetModel filterScreenWidgetModelFactory(BuildContext context) {
  final model = FilterScreenModel(
    context.read<DefaultErrorHandler>(),
    sightRepository: context.read<SightRepository>(),
  );

  return FilterScreenWidgetModel(model);
}

class FilterScreenWidgetModel extends WidgetModel<FilterScreenWidget, FilterScreenModel>
    implements IFilterScreenWidgetModel {
  FilterScreenWidgetModel(FilterScreenModel model) : super(model);

  late final _btnTitleEntityState = EntityStateNotifier<String>(EntityState(data: _showBtnTitle()));
  var _sightFilter = StateNotifier<SightFilter>(initValue: SightFilter.dafult());
  var _foundedSights = <Sight>[];

  @override
  EntityStateNotifier<String> get showBtnTitleStr => _btnTitleEntityState;

  @override
  StateNotifier<SightFilter> get sightFilter => _sightFilter;

  @override
  String get sliderReadableDiaposon => _sliderDiaposon();

  @override
  bool get isShowBtnActive => _foundedSights.isNotEmpty;

  @override
  ThemeData get theme => Theme.of(context);

  @override
  void changeCategory(SightType type) {
    final currentFilter = _sightFilter.value!;
    if (currentFilter.activeTypes.contains(type)) {
      currentFilter.activeTypes.remove(type);
    } else {
      currentFilter.activeTypes.add(type);
    }
    _sightFilter.accept(currentFilter);
    _loadSights();
  }

  @override
  void clearFilterTypes() {
    final currentFilter = _sightFilter.value!..activeTypes.clear();
    _sightFilter.accept(currentFilter);
    _loadSights();
  }

  @override
  void onSliderChangeEnd(RangeValues vals) {
    _loadSights();
  }

  @override
  void onSliderChanged(RangeValues vals) {
    final currentFilter = _sightFilter.value!;
    vals.end < 100
        ? currentFilter.setByRange(RangeValues(vals.start, 100))
        : currentFilter.setByRange(vals);
    _sightFilter.accept(currentFilter);
  }

  @override
  void reloadAfterErrorPressed() {
    _loadSights();
  }

  @override
  void showSightsPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchedSightsScreen(
          sights: _foundedSights,
        ),
      ),
    );
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _sightFilter.accept(
      model.getUserSightFilter(),
    );
    _loadSights();
  }

  @override
  void dispose() {
    model.updateUserSightFilter(_sightFilter.value!);
    super.dispose();
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);
    if (error is NetworkExceptions)
      _btnTitleEntityState.error(error, error.msgForUser);
    else
      _btnTitleEntityState.error(null, AppStrings.unknownError);
  }

  void _changeShowBtnTitle() {
    _btnTitleEntityState.content(_showBtnTitle());
  }

  String _showBtnTitle() => '${AppStrings.show.toUpperCase()} (${_foundedSights.length})';

  String _sliderDiaposon() {
    final filter = _sightFilter.value!;
    return '${AppStrings.from.toLowerCase()} ${_readableDistanceVal(filter.fromDist)} ${AppStrings.to.toLowerCase()} ${_readableDistanceVal(filter.toDist)}';
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

  void _loadSights() async {
    _foundedSights = await model.getSightFromFilter(_sightFilter.value!);
    _changeShowBtnTitle();
  }
}
