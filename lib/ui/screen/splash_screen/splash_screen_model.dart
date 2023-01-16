import 'package:elementary/elementary.dart';
import 'package:places/data/repository/settings_repository.dart';

class SplashScreenModel extends ElementaryModel {
  SplashScreenModel(ErrorHandler errorHandler, this._settingsRepository)
      : super(errorHandler: errorHandler);

  final SettingsRepository _settingsRepository;

  bool isWatchedOnboarding() {
    return _settingsRepository.getIsWatchedOnboarding();
  }
}
