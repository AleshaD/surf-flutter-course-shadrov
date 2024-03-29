import 'package:flutter/material.dart';
import 'package:places/enviroment/build_config.dart';
import 'package:places/enviroment/enviroment.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/app/app_dependencies.dart';

void main() {
  _defineEnviroment(
    buildConfig: _setupConfig(),
  );

  runApp(
    AppDependencies(
      app: App(),
    ),
  );
}

void _defineEnviroment({required BuildConfig buildConfig}) {
  Enviroment.init(buildConfig, BuildType.dev);
}

BuildConfig _setupConfig() {
  return BuildConfig(
    envString: 'Debug',
    envColor: Colors.red,
  );
}
