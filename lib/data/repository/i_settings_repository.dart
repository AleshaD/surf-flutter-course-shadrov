import 'package:places/data/model/enums/theme_type.dart';
import 'package:places/data/model/sights/sight_filter.dart';

abstract class ISettingsRepository {
  /// получить сохранённую тему приложения, по умолчанию
  /// светлую
  ThemeType getThemeType();

  /// сохранить тему приложения
  void setThemeType(ThemeType type);

  /// получить фильтр поиска интересных мест
  SightFilter getSightFilter();

  /// сохранить фильтр поиска интересных мест
  void setSightFilter(SightFilter filter);

  /// смотрел ли онбординг
  bool getIsWatchedOnboarding();

  /// поставить флаг что просмотрел онбоардинг
  void setWatchedOnboarding();
}
