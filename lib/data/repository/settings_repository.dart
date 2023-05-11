import 'dart:convert';

import 'package:places/data/model/sights/sight_filter.dart';
import 'package:places/data/model/enums/theme_type.dart';
import 'package:places/data/database/local_storage.dart';
import 'package:places/data/repository/i_settings_repository.dart';

class SettingsRepository implements ISettingsRepository {
  SettingsRepository(this._storage);

  final LocalStorage _storage;

  @override
  bool getIsWatchedOnboarding() {
    return _storage.getIsWatchedOnboarding();
  }

  @override
  void setWatchedOnboarding() {
    _storage.setIsWatchedOnboarding();
  }

  @override
  SightFilter getSightFilter() {
    final filterJson = _storage.getSightFilterJson();
    if (filterJson != null)
      return SightFilter.fromJson(json.decode(filterJson));
    else
      return SightFilter.dafult();
  }

  @override
  void setSightFilter(SightFilter filter) {
    _storage.setSightFilterJson(
      json.encode(
        filter.toJson(),
      ),
    );
  }

  @override
  ThemeType getThemeType() {
    final themeIndex = _storage.getThemeIndex();
    return ThemeType.values[themeIndex];
  }

  @override
  void setThemeType(ThemeType type) {
    _storage.setThemeIndex(type.index);
  }
}
