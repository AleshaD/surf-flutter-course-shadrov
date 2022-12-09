import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:places/data/interactor/sight_interactor.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/redux/middleware/search_middleware.dart';
import 'package:places/redux/reducer/reducer.dart';
import 'package:places/redux/state/redux_app_state.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class AppDependencies extends StatefulWidget {
  const AppDependencies({Key? key, required this.app}) : super(key: key);

  final Widget app;

  @override
  _AppDependenciesState createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  late final SightRepository _sightRepo;
  late final Store<ReduxAppState> _store;

  @override
  void initState() {
    super.initState();

    final _dioTimeout = 10000;
    _sightRepo = SightRepository(
      Dio(
        BaseOptions(
          connectTimeout: _dioTimeout,
          sendTimeout: _dioTimeout,
          receiveTimeout: _dioTimeout,
          responseType: ResponseType.json,
        ),
      ),
    );

    _store = Store<ReduxAppState>(
      reducer,
      initialState: ReduxAppState(),
      middleware: [
        SearchMiddleware(
          SearchInteractor(_sightRepo),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SightRepository>(create: (context) => _sightRepo),
        Provider<SightInteractor>(create: (_) => SightInteractor(_sightRepo)),
        Provider<SearchInteractor>(create: (_) => SearchInteractor(_sightRepo)),
        Provider<SightImagesInteractor>(
          create: (_) => SightImagesInteractor(
            SightImagesRepository.withDefaultDio(),
          ),
        ),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) => VisitingBloc(
          sightRepository: context.read<SightInteractor>(),
        )..add(VisitingEvent.loadSights()),
        child: StoreProvider<ReduxAppState>(
          store: _store,
          child: widget.app,
        ),
      ),
    );
  }
}
