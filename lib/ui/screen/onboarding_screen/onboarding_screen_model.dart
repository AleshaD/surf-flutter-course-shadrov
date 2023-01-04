import 'package:elementary/elementary.dart';
import 'package:places/data/repository/settings_repository.dart';

class OnboardingScreenModel extends ElementaryModel {
  OnboardingScreenModel(this._settingsRepository) : super();

  final SettingsRepository _settingsRepository;

  void setWatchedOnboarding() {
    _settingsRepository.setWatchedOnboarding();
  }
}
