import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:places/data/interactor/sight_interactor.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/redux/middleware/search_middleware.dart';
import 'package:places/redux/reducer/reducer.dart';
import 'package:places/redux/state/redux_app_state.dart';
import 'package:places/res/app_theme_config.dart';
import 'package:places/ui/screen/home_screen.dart/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'blocs/visiting_bloc/visiting_bloc.dart';

void main() {
  final _dioTimeout = 10000;

  final SightRepository _sightRepo = SightRepository(
    Dio(
      BaseOptions(
        connectTimeout: _dioTimeout,
        sendTimeout: _dioTimeout,
        receiveTimeout: _dioTimeout,
        responseType: ResponseType.json,
      ),
    ),
  );

  final store = Store<ReduxAppState>(
    reducer,
    initialState: ReduxAppState(),
    middleware: [
      SearchMiddleware(
        SearchInteractor(_sightRepo),
      ),
    ],
  );

  runApp(
    App(
      sightRepo: _sightRepo,
      store: store,
    ),
  );
}

class App extends StatefulWidget {
  App({
    Key? key,
    required SightRepository this.sightRepo,
    required Store<ReduxAppState> this.store,
  }) : super(key: key);

  final SightRepository sightRepo;
  final Store<ReduxAppState> store;

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final mockNumber = 8;

  AppThemeConfig _appThemeConfig = AppThemeConfig.light();
  AppThemeConfig get currentThemeConfig => _appThemeConfig;

  void changeTheme(bool toDarkTheme) {
    setState(() {
      toDarkTheme
          ? _appThemeConfig = AppThemeConfig.dark()
          : _appThemeConfig = AppThemeConfig.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SightRepository>(create: (context) => widget.sightRepo),
        Provider<SightInteractor>(create: (_) => SightInteractor(widget.sightRepo)),
        Provider<SearchInteractor>(create: (_) => SearchInteractor(widget.sightRepo)),
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
          store: widget.store,
          child: MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [const Locale('en'), const Locale('ru')],
            title: AppStrings.appTitle,
            theme: _appThemeConfig.data,
            home: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
