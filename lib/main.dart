import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:places/data/interactor/sight_interactor.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/res/app_theme_config.dart';
import 'package:places/ui/screen/home_screen.dart/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final mockNumber = 8;

  static final _dioTimeout = 10000;

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
        Provider<SightInteractor>(create: (_) => SightInteractor(_sightRepo)),
        Provider<SearchInteractor>(create: (_) => SearchInteractor(_sightRepo)),
        Provider<SightImagesInteractor>(
          create: (_) => SightImagesInteractor(
            SightImagesRepository.withDefaultDio(),
          ),
        ),
      ],
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
    );
  }
}
