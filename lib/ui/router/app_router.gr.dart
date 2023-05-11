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
    SearchedSightsRoute.name: (routeData) {
      final args = routeData.argsAs<SearchedSightsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchedSightsScreen(
          key: args.key,
          sights: args.sights,
        ),
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
    AddSightRoute.name: (routeData) {
      final args = routeData.argsAs<AddSightRouteArgs>(
          orElse: () => const AddSightRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddSightScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>(
          orElse: () => const FilterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FilterScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    PickCoordinateOnMapRoute.name: (routeData) {
      final args = routeData.argsAs<PickCoordinateOnMapRouteArgs>(
          orElse: () => const PickCoordinateOnMapRouteArgs());
      return AutoRoutePage<Coordinate?>(
        routeData: routeData,
        child: PickCoordinateOnMapScreen(key: args.key),
      );
    },
    SightDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SightDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SightDetailsScreen(
          sight: args.sight,
          topCornersRadius: args.topCornersRadius,
          showBottomSheetNav: args.showBottomSheetNav,
          scrollController: args.scrollController,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SightSearchRoute.name: (routeData) {
      final args = routeData.argsAs<SightSearchRouteArgs>(
          orElse: () => const SightSearchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SightSearchScreen(
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
/// [SearchedSightsScreen]
class SearchedSightsRoute extends PageRouteInfo<SearchedSightsRouteArgs> {
  SearchedSightsRoute({
    Key? key,
    required List<Sight> sights,
    List<PageRouteInfo>? children,
  }) : super(
          SearchedSightsRoute.name,
          args: SearchedSightsRouteArgs(
            key: key,
            sights: sights,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchedSightsRoute';

  static const PageInfo<SearchedSightsRouteArgs> page =
      PageInfo<SearchedSightsRouteArgs>(name);
}

class SearchedSightsRouteArgs {
  const SearchedSightsRouteArgs({
    this.key,
    required this.sights,
  });

  final Key? key;

  final List<Sight> sights;

  @override
  String toString() {
    return 'SearchedSightsRouteArgs{key: $key, sights: $sights}';
  }
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

/// generated route for
/// [AddSightScreen]
class AddSightRoute extends PageRouteInfo<AddSightRouteArgs> {
  AddSightRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultAddSightWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AddSightRoute.name,
          args: AddSightRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AddSightRoute';

  static const PageInfo<AddSightRouteArgs> page =
      PageInfo<AddSightRouteArgs>(name);
}

class AddSightRouteArgs {
  const AddSightRouteArgs({
    this.key,
    this.wmFactory = defaultAddSightWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AddSightRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [FilterScreen]
class FilterRoute extends PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = filterScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          FilterRoute.name,
          args: FilterRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const PageInfo<FilterRouteArgs> page = PageInfo<FilterRouteArgs>(name);
}

class FilterRouteArgs {
  const FilterRouteArgs({
    this.key,
    this.wmFactory = filterScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [PickCoordinateOnMapScreen]
class PickCoordinateOnMapRoute
    extends PageRouteInfo<PickCoordinateOnMapRouteArgs> {
  PickCoordinateOnMapRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PickCoordinateOnMapRoute.name,
          args: PickCoordinateOnMapRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PickCoordinateOnMapRoute';

  static const PageInfo<PickCoordinateOnMapRouteArgs> page =
      PageInfo<PickCoordinateOnMapRouteArgs>(name);
}

class PickCoordinateOnMapRouteArgs {
  const PickCoordinateOnMapRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'PickCoordinateOnMapRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SightDetailsScreen]
class SightDetailsRoute extends PageRouteInfo<SightDetailsRouteArgs> {
  SightDetailsRoute({
    required Sight sight,
    double topCornersRadius = 0,
    bool showBottomSheetNav = false,
    ScrollController? scrollController,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultSightDetailsScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SightDetailsRoute.name,
          args: SightDetailsRouteArgs(
            sight: sight,
            topCornersRadius: topCornersRadius,
            showBottomSheetNav: showBottomSheetNav,
            scrollController: scrollController,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SightDetailsRoute';

  static const PageInfo<SightDetailsRouteArgs> page =
      PageInfo<SightDetailsRouteArgs>(name);
}

class SightDetailsRouteArgs {
  const SightDetailsRouteArgs({
    required this.sight,
    this.topCornersRadius = 0,
    this.showBottomSheetNav = false,
    this.scrollController,
    this.key,
    this.wmFactory = defaultSightDetailsScreenWidgetModelFactory,
  });

  final Sight sight;

  final double topCornersRadius;

  final bool showBottomSheetNav;

  final ScrollController? scrollController;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SightDetailsRouteArgs{sight: $sight, topCornersRadius: $topCornersRadius, showBottomSheetNav: $showBottomSheetNav, scrollController: $scrollController, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SightSearchScreen]
class SightSearchRoute extends PageRouteInfo<SightSearchRouteArgs> {
  SightSearchRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultSightSearchScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SightSearchRoute.name,
          args: SightSearchRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SightSearchRoute';

  static const PageInfo<SightSearchRouteArgs> page =
      PageInfo<SightSearchRouteArgs>(name);
}

class SightSearchRouteArgs {
  const SightSearchRouteArgs({
    this.key,
    this.wmFactory = defaultSightSearchScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SightSearchRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}
