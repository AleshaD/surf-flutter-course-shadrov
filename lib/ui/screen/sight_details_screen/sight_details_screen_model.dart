import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:places/data/model/sights/sight.dart';

class SightDetailsScreenModel extends ElementaryModel {
  SightDetailsScreenModel(
    ErrorHandler errorHandler,
    VisitingBloc visitingBloc,
    SightImagesInteractor imageInteractor,
  )   : this._visitingBloc = visitingBloc,
        this._imageInteractor = imageInteractor,
        super(errorHandler: errorHandler);

  final VisitingBloc _visitingBloc;
  final SightImagesInteractor _imageInteractor;

  bool isSightInWantToVisitList(Sight sight) {
    return _visitingBloc.state.isSightInWantToVisitList(sight);
  }

  void addWantToVisitTime(DateTime date, Sight sight) {
    _visitingBloc.add(
      VisitingEvent.addWantToVisitTime(
        sight: sight,
        date: date,
      ),
    );
  }

  void deleteFromVisitingList(Sight sight) {
    _visitingBloc.add(VisitingEvent.deleteFromWantToVisit(sight: sight));
  }

  void addToWantToVisitingList(Sight sight) {
    _visitingBloc.add(VisitingEvent.addToWantToVisit(sight: sight));
  }

  void addToVisitedList(Sight sight) {
    _visitingBloc.add(VisitingEvent.addToVisited(sight: sight));
  }

  Image getImageWidgetWithoutImageData() {
    return _imageInteractor.noImage();
  }
}
