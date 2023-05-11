import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/data/database/app_db.dart';
import 'package:places/data/repository/favorit_sights_repository.dart';
import 'package:places/data/database/local_storage.dart';
import 'package:places/data/repository/location_repository.dart';
import 'package:places/data/repository/search_repository.dart';
import 'package:places/data/services/sight_images_service.dart';
import 'package:places/data/repository/settings_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/api/sights_api.dart';
import 'package:places/ui/app/app_dependencies_notifier.dart';
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
  late final SettingsRepository _settingsRepository;
  late final FavoritSightsRepository _favoritSightsRepository;
  late final _imgRepo;
  final AppDb _appDb = AppDb();
  final LocalStorage _localStorage = LocalStorage();
  var dependeciesInited = false;

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
    _imgRepo = SightImagesRepository.withDefaultDio(_sightApi);
    _settingsRepository = SettingsRepository(_localStorage);
    _favoritSightsRepository = FavoritSightsRepository(_appDb);
    _initDependecies();
  }

  Future<void> _initDependecies() async {
    await _localStorage.init();
    setState(() {
      dependeciesInited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppDependenciesNotifier(
      dependencyesInited: dependeciesInited,
      child: MultiProvider(
        providers: [
          Provider<SightsApi>(create: (context) => _sightApi),
          Provider<SightRepository>(
            create: (_) => SightRepository(_sightApi, _settingsRepository),
          ),
          Provider<FavoritSightsRepository>(
            create: (_) => _favoritSightsRepository,
          ),
          Provider<SearchRepository>(
            create: (_) => SearchRepository(_sightApi, _appDb),
            lazy: false,
          ),
          Provider<SettingsRepository>(create: (_) => _settingsRepository),
          Provider<SightImagesRepository>(create: (_) => _imgRepo),
          Provider<SightImagesService>(create: (_) => SightImagesService(_imgRepo)),
          Provider<LocationRepository>(
            create: (_) => LocationRepository(storage: _localStorage),
          ),
          Provider<DefaultErrorHandler>(create: (_) => DefaultErrorHandler()),
        ],
        child: BlocProvider(
          lazy: false,
          create: (context) => VisitingBloc(
            favoriteSightRepository: _favoritSightsRepository,
          )..add(VisitingEvent.loadSights()),
          child: widget.app,
        ),
      ),
    );
  }
}
