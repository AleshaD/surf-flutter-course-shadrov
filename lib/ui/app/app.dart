import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/enums/theme_type.dart';
import 'package:places/data/repository/settings_repository.dart';
import 'package:places/res/app_theme_config.dart';
import 'package:places/ui/app/app_dependencies_notifier.dart';
import 'package:places/ui/screen/splash_screen/splash_screen_widget.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  AppThemeConfig _appThemeConfig = AppThemeConfig.light();
  AppThemeConfig get currentThemeConfig => _appThemeConfig;
  bool get isDarkTheme => currentThemeConfig.isDark;

  static AppState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppState>();
  }

  void changeTheme(bool toDarkTheme) {
    setState(() {
      var type = ThemeType.light;
      if (toDarkTheme) {
        type = ThemeType.dark;
      }
      context.read<SettingsRepository>().setThemeType(type);
      _appThemeConfig = AppThemeConfig(type);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final inited = AppDependenciesNotifier.of(context).dependencyesInited;
    if (inited) {
      setState(() {
        final themeType = context.read<SettingsRepository>().getThemeType();
        _appThemeConfig = AppThemeConfig(themeType);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en'), const Locale('ru')],
      title: AppStrings.appTitle,
      theme: _appThemeConfig.data,
      home: SplashScreenWidget(),
    );
  }
}
