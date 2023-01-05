import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/data/database/app_db.dart';
import 'package:places/data/repository/search_repository.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/providers/sights_api.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatefulWidget {
  const AppDependencies({Key? key, required this.app}) : super(key: key);

  final Widget app;

  @override
  _AppDependenciesState createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  late final SightsApi _sightApi;
  final AppDb _appDb = AppDb();

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
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SightsApi>(create: (context) => _sightApi),
        Provider<SightRepository>(create: (_) => SightRepository(_sightApi)),
        Provider<SearchRepository>(
          create: (_) => SearchRepository(_sightApi, _appDb),
          lazy: false,
        ),
        Provider<SightImagesInteractor>(
          create: (_) => SightImagesInteractor(
            SightImagesRepository.withDefaultDio(),
          ),
        ),
        Provider<DefaultErrorHandler>(create: (_) => DefaultErrorHandler()),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) => VisitingBloc(
          sightRepository: context.read<SightRepository>(),
        )..add(VisitingEvent.loadSights()),
        child: widget.app,
      ),
    );
  }
}
