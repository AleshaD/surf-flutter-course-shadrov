import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_widget.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen_widget.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:provider/provider.dart';
import 'sight_list_screen_model.dart';
import 'sight_list_screen_widget.dart';

abstract class ISightListScreenWidgetModel extends IWidgetModel {
  EntityStateNotifier<List<Sight>> get sights;
  ThemeData get theme;
  bool get isPortraitOrientation;
  bool get showNewPlaceBtn;
  String get errorMsg;

  void onErrorReloadTaped();
  void onSearchBarTaped();
  void onNewPlaceTaped();
}

SightListScreenWidgetModel sightListScreenWidgetModelFactory(BuildContext context) {
  return SightListScreenWidgetModel(
    SightListScreenModel(
      context.read<DefaultErrorHandler>(),
      sightRepository: context.read<SightRepository>(),
    ),
  );
}

class SightListScreenWidgetModel extends WidgetModel<SightListScreenWidget, SightListScreenModel>
    implements ISightListScreenWidgetModel {
  SightListScreenWidgetModel(SightListScreenModel model) : super(model);

  final _sightsEntityState = EntityStateNotifier<List<Sight>>(EntityState.loading());
  var _errorMessage = AppStrings.unknownError;

  @override
  EntityStateNotifier<List<Sight>> get sights => _sightsEntityState;

  @override
  ThemeData get theme => Theme.of(context);

  @override
  bool get isPortraitOrientation => MediaQuery.of(context).orientation == Orientation.portrait;

  @override
  bool get showNewPlaceBtn => _sightsEntityState.value!.data!.isNotEmpty;

  @override
  String get errorMsg => _errorMessage;

  @override
  void onSearchBarTaped() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SightSearchScreenWidget(),
      ),
    );
  }

  @override
  void onNewPlaceTaped() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => AddSightWidget(),
          ),
        )
        .then((_) => _loadSights());
  }

  @override
  void onErrorReloadTaped() {
    _loadSights();
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadSights();
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);
    if (error is NetworkExceptions)
      _errorMessage = error.msgForUser;
    else
      _errorMessage = AppStrings.unknownError;
    _sightsEntityState.error(error as Exception, []);
  }

  void _loadSights() async {
    _sightsEntityState.loading();
    final sights = await model.loadSights();
    _sightsEntityState.content(sights);
  }
}
