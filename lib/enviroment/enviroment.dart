import 'package:places/enviroment/build_config.dart';

enum BuildType {
  dev,
  profile,
  prod,
}

class Enviroment {
  Enviroment._({
    required this.buildConfig,
    required this.buildType,
  });

  static Enviroment? _enviroment;

  final BuildConfig buildConfig;
  final BuildType buildType;

  static void init(BuildConfig buildConfig, BuildType buildType) {
    _enviroment = Enviroment._(buildConfig: buildConfig, buildType: buildType);
  }

  static Enviroment instance() => _enviroment!;
}
