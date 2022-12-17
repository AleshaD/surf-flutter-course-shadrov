import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:provider/provider.dart';
import 'visiting_screen_model.dart';
import 'visiting_screen_widget.dart';

abstract class IVisitingScreenWidgetModel extends IWidgetModel {
  ThemeData get theme;
  EntityStateNotifier<VisitingState> get visitingState;

  void loadSights();
  void onReloadAfterError();
}

VisitingScreenWidgetModel visitingScreenWidgetModelFactory(BuildContext context) {
  return VisitingScreenWidgetModel(
    VisitingScreenModel(
      context.read<DefaultErrorHandler>(),
      context.read<VisitingBloc>(),
    ),
  );
}

class VisitingScreenWidgetModel extends WidgetModel<VisitingScreenWidget, VisitingScreenModel>
    implements IVisitingScreenWidgetModel {
  VisitingScreenWidgetModel(VisitingScreenModel model) : super(model);

  final _visitingState = EntityStateNotifier<VisitingState>();
  late final StreamSubscription<VisitingState> _visitingStateSubscription;

  @override
  void loadSights() {
    model.loadSights(hideLoading: false);
  }

  @override
  void onReloadAfterError() {
    model.loadSights(hideLoading: true);
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  EntityStateNotifier<VisitingState> get visitingState => _visitingState;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _visitingStateSubscription = model.visitingStateStream.listen((state) {
      setVistingState(state);
    });
    setVistingState(model.currentVisitingState);
    model.loadSights(hideLoading: true);
  }

  @override
  void dispose() {
    super.dispose();
    _visitingStateSubscription.cancel();
  }

  void setVistingState(VisitingState state) {
    if (state.loadingInProgress) {
      _visitingState.loading(state);
    } else if (state.hasError) {
      _visitingState.error(null, state);
    } else {
      _visitingState.content(state);
    }
  }
}
