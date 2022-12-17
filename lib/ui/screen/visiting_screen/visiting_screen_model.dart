import 'package:elementary/elementary.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';

class VisitingScreenModel extends ElementaryModel {
  VisitingScreenModel(
    ErrorHandler errorHandler,
    VisitingBloc visitingBloc,
  )   : this._visitingBloc = visitingBloc,
        super(errorHandler: errorHandler);

  VisitingBloc _visitingBloc;

  Stream<VisitingState> get visitingStateStream => _visitingBloc.stream;

  VisitingState get currentVisitingState => _visitingBloc.state;

  void loadSights({required bool hideLoading}) {
    _visitingBloc.add(
      VisitingEvent.loadSights(hideLoading: hideLoading),
    );
  }
}
