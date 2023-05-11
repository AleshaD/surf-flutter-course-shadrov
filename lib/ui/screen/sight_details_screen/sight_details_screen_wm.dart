import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/services/sight_images_service.dart';
import 'package:places/ui/widgets/pickers.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:places/util/map_launcher_to_sight.dart';
import 'package:provider/provider.dart';
import 'sight_details_screen_model.dart';
import 'sight_details_screen.dart';

abstract class ISightDetailsScreenWidgetModel extends IWidgetModel {
  ThemeData get theme;
  Image get noImage;
  String get closeUntilTime;
  StateNotifier<bool> get isInWantToVisit;

  void backBtnPressed();
  void createRoutePressed();
  void addTimeToVisitPressed();
  void onHeartBtnPressed();
}

SightDetailsScreenWidgetModel defaultSightDetailsScreenWidgetModelFactory(
    BuildContext context) {
  return SightDetailsScreenWidgetModel(
    SightDetailsScreenModel(
      context.read<DefaultErrorHandler>(),
      context.read<VisitingBloc>(),
      context.read<SightImagesService>(),
    ),
  );
}

class SightDetailsScreenWidgetModel
    extends WidgetModel<SightDetailsScreen, SightDetailsScreenModel>
    with MapLauncherToSight
    implements ISightDetailsScreenWidgetModel {
  SightDetailsScreenWidgetModel(SightDetailsScreenModel model) : super(model);

  final _isInWantToVisitList = StateNotifier<bool>(initValue: false);

  @override
  ThemeData get theme => Theme.of(context);

  @override
  Image get noImage => model.getImageWidgetWithoutImageData();

  @override
  String get closeUntilTime => '${AppStrings.closeUntil.toLowerCase()} 09:00';

  @override
  StateNotifier<bool> get isInWantToVisit => _isInWantToVisitList;

  @override
  void backBtnPressed() {
    Navigator.of(context).pop();
  }

  @override
  void createRoutePressed() {
    showBottomSheetForMapLaunch(
      context,
      sight: widget.sight,
      onLaunch: () => model.addToVisitedList(widget.sight),
    );
  }

  @override
  void addTimeToVisitPressed() async {
    DateTime? dateTime = await Pickers.pickDateAndTime(context);
    if (dateTime != null) {
      model.addWantToVisitTime(dateTime, widget.sight);
    }

    _checkAndSetIsSightInWantToVisitList();
  }

  @override
  void onHeartBtnPressed() {
    _isInWantToVisitList.value!
        ? model.deleteFromVisitingList(widget.sight)
        : model.addToWantToVisitingList(widget.sight);

    _checkAndSetIsSightInWantToVisitList();
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _checkAndSetIsSightInWantToVisitList();
  }

  void _checkAndSetIsSightInWantToVisitList() {
    Future.delayed(Duration(milliseconds: 100), () {
      final isInVisitList = model.isSightInWantToVisitList(widget.sight);
      _isInWantToVisitList.accept(isInVisitList);
    });
  }
}
