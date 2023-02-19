import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/data/repository/favorit_sights_repository.dart';
import 'package:places/data/repository/location_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_widget.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen_widget.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:places/util/map_launcher_to_sight.dart';
import 'package:places/util/yandex_map_helper.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'sights_map_model.dart';
import 'sights_map_widget.dart';

abstract class ISightsMapWidgetModel extends IWidgetModel {
  /// Тема приложения
  ThemeData get theme;

  /// Чтобы затемнить при необходимости карту при построении
  bool get isDarkTheme;

  /// Показать ли активное место на карте
  bool get isShowedActivePlace;

  /// Размер экрана для bottom appBar, завязан на didChangeDependencies
  double get screenWidth;

  /// Ключ карты чтобы не перестраивать виджет при обновлении объектов на карте
  GlobalKey get yaMapKey;

  /// Оповестить карту чтобы обновила объекты
  EntityStateNotifier<List<MapObject>> get mapObjectsNotifier;

  /// Изменение активного места на карте
  StateNotifier<Sight?> get activeSightState;

  /// Завершение построения карты.
  /// По этому коллбэку формируем стиль карты и добавляем объекты на карту
  void onMapCreated(YandexMapController controller);

  /// Нажатие на поиск в appBar
  void onSearchFieldTaped();

  /// Обновить места на карте по нажатию кнопки
  void updatePlacesOnMap();

  /// Переместить камеру на пользователя
  void moveCameraToUserOrRequestPermission();

  /// Определить свайп по карточке, чтобы её скрыть
  void onCardVerticalDrag(DragUpdateDetails details);

  /// Создание нового места
  void onNewPlaceTaped();

  /// Нажатие на кнопку "Проложить маршрут до места"
  void onCreateRoutePressed();
}

SightsMapWidgetModel defaultSightsMapWidgetModelFactory(BuildContext context) {
  return SightsMapWidgetModel(
    SightsMapModel(
      context.read<DefaultErrorHandler>(),
      context.read<LocationRepository>(),
      context.read<SightRepository>(),
      context.read<FavoritSightsRepository>(),
    ),
  );
}

class SightsMapWidgetModel extends WidgetModel<SightsMapWidget, SightsMapModel>
    with MapLauncherToSight, YandexMapHelper
    implements ISightsMapWidgetModel {
  SightsMapWidgetModel(SightsMapModel model) : super(model);

  double _screenWidth = 0;

  /// Контроллер для управления яндекс картами
  YandexMapController? _yandexMapCtrl;

  /// Опопвещение view чтобы изменить отобаражемые места на карте
  final _mapObjectsNotifier =
      EntityStateNotifier<List<MapObject>>(EntityState.content([]));

  /// Изменение активного места на карте
  final _activeSightState = StateNotifier<Sight?>(initValue: null);

  /// Ключ для виджета яндекс карт, чтобы не перестраивать карту при изменении
  /// объектов на карте
  final _yaMapKey = GlobalKey();

  /// Активное место на карте
  MapObject? _activePlacemark;

  /// Отображаемые места на карте
  List<Sight> _sightsOnMap = [];

  /// Переменные чтобы при каждом перестроении карты не создавать
  /// картинки для объектов
  Uint8List? _sightImageBytes;
  Uint8List? _activeSightImageBytes;

  @override
  ThemeData get theme => Theme.of(context);

  @override
  GlobalKey<State<StatefulWidget>> get yaMapKey => _yaMapKey;

  @override
  bool get isDarkTheme => AppState.of(context)!.isDarkTheme;

  @override
  bool get isShowedActivePlace => _activeSightState.value != null;

  @override
  double get screenWidth => _screenWidth;

  @override
  EntityStateNotifier<List<MapObject>> get mapObjectsNotifier => _mapObjectsNotifier;

  @override
  StateNotifier<Sight?> get activeSightState => _activeSightState;

  @override
  void updatePlacesOnMap() {
    _updatePlaceMarks(withLoad: true);
  }

  @override
  void moveCameraToUserOrRequestPermission() async {
    final userPosition = await model.getUserPosition(forcesRequest: true);
    if (userPosition != null) {
      moveCameraTo(
        _yandexMapCtrl,
        Point(latitude: userPosition.latitude, longitude: userPosition.longitude),
        durationInSec: 0.15,
      );
    }
  }

  @override
  void onMapCreated(YandexMapController mapCtrl) async {
    final userCoordinate = await model.getUserCoordinate();
    _yandexMapCtrl = mapCtrl..setMapStyle(mapStyle());
    moveCameraTo(
      _yandexMapCtrl,
      Point(
        latitude: userCoordinate?.lat ?? mskPoint.latitude,
        longitude: userCoordinate?.lng ?? mskPoint.longitude,
      ),
      zoom: userCoordinate != null ? 14 : 8,
      durationInSec: 0.15,
    );
    _updatePlaceMarks(withLoad: true);
  }

  @override
  void onCardVerticalDrag(DragUpdateDetails details) {
    int sensitivity = 8;
    if (details.delta.dy > sensitivity) {
      _activeSightState.accept(null);
      _updatePlaceMarks();
    }
  }

  @override
  void onSearchFieldTaped() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SightSearchScreenWidget(),
      ),
    );
  }

  @override
  void onNewPlaceTaped() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => AddSightWidget(),
          ),
        )
        .then(
          (_) => _updatePlaceMarks(withLoad: true),
        );
  }

  @override
  void onCreateRoutePressed() async {
    final sight = _activeSightState.value;
    if (sight != null)
      showBottomSheetForMapLaunch(
        context,
        sight: sight,
        onLaunch: () => model.addToVisitedSights(sight),
      );
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  /// Подсветить выбранную точку на карте.
  /// Или убрать подсвеченную с карты.
  void _onPlacemarkTaped(MapObject mapObject, Point point) {
    final activeSightId = _activeSightState.value?.id.toString();
    final mObjId = mapObject.mapId.value;
    if (activeSightId != mObjId) {
      final sight = _getSightFromMapedSightsById(mObjId);
      _activeSightState.accept(_getSightFromMapedSightsById(mObjId));
      moveCameraTo(_yandexMapCtrl, Point(latitude: sight.lat, longitude: sight.lng));
    } else if (_activePlacemark?.mapId == mapObject.mapId) {
      _activeSightState.accept(null);
    }

    _updatePlaceMarks();
  }

  Future<void> _updatePlaceMarks({bool withLoad = false}) async {
    final userPosition = await model.getUserPosition();
    final userCoordinate = userPosition != null
        ? Coordinate(lat: userPosition.latitude, lng: userPosition.longitude)
        : null;

    /// Загрузить новые места основываясь на координатах пользователя
    /// Если координаты отсутствуют, то получим все места
    if (withLoad) {
      _sightsOnMap = await model.getSights(userCoordinate);
    }

    /// Размер кружка места на карте, [userMarkDefaultSize] из миксина
    final placeMarkSize = userMarkDefaultSize / 2;

    /// userPlacemark добавлет в список объектов точку пользователя
    /// с кругом точности определения координат, если userPosition = null, то
    /// возращает пустой список
    final mapObjects = await userPlacemark(
      position: userPosition,
      theme: theme,
    );

    /// Картинка обычного места, закрашенный кружок в соответствии с темой приложеня
    _sightImageBytes ??=
        await rawPlacemarkImage(placeMarkSize, theme.colorScheme.onBackground);

    /// Картинка активного места на карте
    _activeSightImageBytes ??= await rawPlacemarkImage(
      placeMarkSize * 2,
      theme.colorScheme.secondary,
    );

    final activeSightId = _activeSightState.value?.id.toString();
    for (var s in _sightsOnMap) {
      var id = MapObjectId('${s.id}');
      final isActive = id.value == activeSightId;
      mapObjects.add(
        PlacemarkMapObject(
          mapId: id,
          point: Point(latitude: s.lat, longitude: s.lng),
          opacity: 1,
          icon: PlacemarkIcon.composite(
            [
              PlacemarkCompositeIconItem(
                style: PlacemarkIconStyle(
                  zIndex: isActive ? 2 : 1,
                  image: isActive
                      ? BitmapDescriptor.fromBytes(_activeSightImageBytes!)
                      : BitmapDescriptor.fromBytes(_sightImageBytes!),
                ),
                name: 's_${s.name}',
              ),
            ],
          ),
          onTap: _onPlacemarkTaped,
        ),
      );
    }

    /// Передаём места на view
    _mapObjectsNotifier.content(mapObjects);
  }

  Sight _getSightFromMapedSightsById(String id) {
    final sId = int.parse(id);
    return _sightsOnMap.firstWhere((s) => s.id == sId);
  }
}
