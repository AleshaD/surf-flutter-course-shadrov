import 'package:flutter/material.dart';

class AppDependenciesNotifier extends InheritedWidget {
  final dependencyesInited;

  AppDependenciesNotifier({
    required this.dependencyesInited,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(AppDependenciesNotifier oldWidget) {
    return oldWidget.dependencyesInited != dependencyesInited;
  }

  static AppDependenciesNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependenciesNotifier>()!;
  }
}
