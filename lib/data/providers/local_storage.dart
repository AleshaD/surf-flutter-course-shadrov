import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences pref;
  final String _themeKey = 'theme_type';
  final String _sightFilterKey = 'sight_filter';
  final String _isWatchedOnboardingKey = 'watched_onboarding';
  final String _previousLocationRequestTime = 'previous_location_request_time';

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  int getThemeIndex() {
    return pref.getInt(_themeKey) ?? 0;
  }

  void setThemeIndex(int index) {
    pref.setInt(_themeKey, index);
  }

  String? getSightFilterJson() {
    return pref.getString(_sightFilterKey);
  }

  void setSightFilterJson(String json) {
    pref.setString(_sightFilterKey, json);
  }

  bool getIsWatchedOnboarding() {
    return pref.getBool(_isWatchedOnboardingKey) ?? false;
  }

  void setIsWatchedOnboarding() {
    pref.setBool(_isWatchedOnboardingKey, true);
  }

  DateTime getPreviousLocationRequestTime() {
    final ms = pref.getInt(_previousLocationRequestTime);

    return DateTime.fromMillisecondsSinceEpoch(ms ?? 0);
  }

  void setPreviousLocationRequestTime(DateTime time) {
    pref.setInt(_previousLocationRequestTime, time.millisecondsSinceEpoch);
  }
}
