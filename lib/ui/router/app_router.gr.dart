// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnboardingScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SightListRoute.name: (routeData) {
      final args = routeData.argsAs<SightListRouteArgs>(
          orElse: () => const SightListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SightListScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SightsMapRoute.name: (routeData) {
      final args = routeData.argsAs<SightsMapRouteArgs>(
          orElse: () => const SightsMapRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SightsMapScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    VisitingRoute.name: (routeData) {
      final args = routeData.argsAs<VisitingRouteArgs>(
          orElse: () => const VisitingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VisitingScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
  };
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = onboardingScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<OnboardingRouteArgs> page =
      PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({
    this.key,
    this.wmFactory = onboardingScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SightListScreen]
class SightListRoute extends PageRouteInfo<SightListRouteArgs> {
  SightListRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = sightListScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SightListRoute.name,
          args: SightListRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SightListRoute';

  static const PageInfo<SightListRouteArgs> page =
      PageInfo<SightListRouteArgs>(name);
}

class SightListRouteArgs {
  const SightListRouteArgs({
    this.key,
    this.wmFactory = sightListScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SightListRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SightsMapScreen]
class SightsMapRoute extends PageRouteInfo<SightsMapRouteArgs> {
  SightsMapRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultSightsMapWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SightsMapRoute.name,
          args: SightsMapRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SightsMapRoute';

  static const PageInfo<SightsMapRouteArgs> page =
      PageInfo<SightsMapRouteArgs>(name);
}

class SightsMapRouteArgs {
  const SightsMapRouteArgs({
    this.key,
    this.wmFactory = defaultSightsMapWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SightsMapRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [VisitingScreen]
class VisitingRoute extends PageRouteInfo<VisitingRouteArgs> {
  VisitingRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = visitingScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          VisitingRoute.name,
          args: VisitingRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'VisitingRoute';

  static const PageInfo<VisitingRouteArgs> page =
      PageInfo<VisitingRouteArgs>(name);
}

class VisitingRouteArgs {
  const VisitingRouteArgs({
    this.key,
    this.wmFactory = visitingScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'VisitingRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultSplashScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.key,
    this.wmFactory = defaultSplashScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}
