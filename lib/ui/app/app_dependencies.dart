import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/data/repository/search_repository.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/providers/sights_api.dart';
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
  late final SightsApi _sightApi;
  late final Store<ReduxAppState> _store;

  @override
  void initState() {
    super.initState();

    final _dioTimeout = 10000;
    _sightApi = SightsApi(
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
          SearchRepository(_sightApi),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SightsApi>(create: (context) => _sightApi),
        Provider<SightRepository>(create: (_) => SightRepository(_sightApi)),
        Provider<SearchRepository>(create: (_) => SearchRepository(_sightApi)),
        Provider<SightImagesInteractor>(
          create: (_) => SightImagesInteractor(
            SightImagesRepository.withDefaultDio(),
          ),
        ),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) => VisitingBloc(
          sightRepository: context.read<SightRepository>(),
        )..add(VisitingEvent.loadSights()),
        child: StoreProvider<ReduxAppState>(
          store: _store,
          child: widget.app,
        ),
      ),
    );
  }
}
