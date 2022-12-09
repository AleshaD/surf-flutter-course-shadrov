import 'dart:io';

import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/sight_interactor.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen/screen_widgets/choose_category_screen.dart';
import 'package:provider/provider.dart';
import 'add_sight_model.dart';
import 'add_sight_widget.dart';
import 'screen_widgets/add_photo_pick_source_page.dart';

abstract class IAddSightWidgetModel extends IWidgetModel {
  TextEditingController get descriptionController;
  TextEditingController get latitudeController;
  TextEditingController get longitudeController;
  TextEditingController get nameController;
  FocusNode get descriptionNode;
  FocusNode get latitudeNode;
  FocusNode get longitudeNode;
  FocusNode get nameNode;
  FormFieldValidator<String>? get descriptionValidator;
  FormFieldValidator<String>? get nameValidator;
  ScrollController get scrollController;
  GlobalKey<FormState> get formKey;
  ThemeData get theme;
  double get widthOfCoordinateTxtFields;
  double get sideScreenPadding;
  double get spaceBetwenTextFields;

  ListenableState<EntityState<List<String>>> get pathsToSightPhotos;
  ListenableState<EntityState<String>> get chosenSightTypeStr;
  ListenableState<EntityState<bool>> get isCreateBtnActive;

  void popScreen();
  void showBottomSheetForNewPhoto();
  void removePhotoByPath(String path);
  void chooseSightTypeTaped();
  void checkIsCreateBtnActive();
  void requestFocusTo(FocusNode node);
  void onLatitudeEditingComplete();
  void onLongitudeEditingComplete();
  void createSight();
  void pickCoordinateOnMap();
}

AddSightWidgetModel defaultAddSightWidgetModelFactory(BuildContext context) {
  final model = AddSightModel(
    sightInteractor: context.read<SightInteractor>(),
  );
  return AddSightWidgetModel(
    model,
  );
}

class AddSightWidgetModel extends WidgetModel<AddSightWidget, AddSightModel>
    implements IAddSightWidgetModel {
  AddSightWidgetModel(AddSightModel model) : super(model);

  SightType? __chosenSightType;
  SightType? get _chosenSightType => __chosenSightType;
  set _chosenSightType(SightType? type) {
    __chosenSightType = type;
    if (type != null) _chosenSightTypeStr.content(Sight.getTypeNameBy(type));
  }

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final FocusNode descriptionNode = FocusNode();
  final FocusNode latitudeNode = FocusNode();
  final FocusNode longitudeNode = FocusNode();
  final FocusNode nameNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final descriptionValidator = (value) {
    if (value == null || value.isEmpty) {
      return AppStrings.enterTheDescription;
    }

    return null;
  };

  final nameValidator = (value) {
    if (value == null || value.isEmpty) {
      return AppStrings.enterTheTitle;
    }

    return null;
  };

  final _pathsToSightPhotosState = EntityStateNotifier<List<String>>(
    EntityState(
      data: mockImagesPaths.toList(),
    ),
  );
  final _chosenSightTypeStr = EntityStateNotifier<String>(
    EntityState(data: AppStrings.noPick),
  );
  final _isCreateBtnActive = EntityStateNotifier<bool>(EntityState(data: false));

  @override
  double get spaceBetwenTextFields => 16;

  @override
  double get sideScreenPadding => 16;

  @override
  ListenableState<EntityState<List<String>>> get pathsToSightPhotos => _pathsToSightPhotosState;

  @override
  ListenableState<EntityState<String>> get chosenSightTypeStr => _chosenSightTypeStr;

  @override
  ListenableState<EntityState<bool>> get isCreateBtnActive => _isCreateBtnActive;

  late ThemeData _themeState;
  @override
  ThemeData get theme => _themeState;

  late double _widthOfCoordinateTxtFields;
  @override
  double get widthOfCoordinateTxtFields => _widthOfCoordinateTxtFields;

  @override
  void popScreen() {
    Navigator.of(context).pop();
  }

  @override
  void requestFocusTo(FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  @override
  void checkIsCreateBtnActive() {
    bool canBeActive = nameController.text != '' &&
        latitudeController.text != '' &&
        longitudeController.text != '' &&
        descriptionController.text != '' &&
        _chosenSightType != null;

    // меняем состояние пкнопки только если это необходимо
    if (canBeActive != _isCreateBtnActive.value) {
      canBeActive && formKey.currentState!.validate()
          ? _isCreateBtnActive.content(true)
          : _isCreateBtnActive.content(false);
    }
  }

  @override
  void chooseSightTypeTaped() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => ChooseCategoryScreen(
          initCategory: _chosenSightType,
        ),
      ),
    )
        .then(
      (value) {
        if (value is SightType) {
          _chosenSightType = value;
          checkIsCreateBtnActive();
        }
      },
    );
  }

  @override
  void removePhotoByPath(String path) {
    final currentPaths = _pathsToSightPhotosState.value!.data!;
    currentPaths.removeWhere((photoPath) => photoPath == path);
    _pathsToSightPhotosState.content(currentPaths);
  }

  @override
  void showBottomSheetForNewPhoto() async {
    PickPhotoSourceType? fromSource = await showModalBottomSheet<PickPhotoSourceType>(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: AddPhotoPickSourcePage(),
        );
      },
    );
    if (fromSource != null) print('pick from $fromSource');
  }

  @override
  void onLatitudeEditingComplete() {
    if (longitudeController.text == '') requestFocusTo(longitudeNode);
  }

  @override
  void onLongitudeEditingComplete() {
    if (descriptionController.text == '') requestFocusTo(descriptionNode);
  }

  @override
  void createSight() async {
    if (!formKey.currentState!.validate()) return;

    final sightForAdd = Sight.onCreate(
      name: nameController.text,
      lat: double.parse(latitudeController.text),
      lng: double.parse(longitudeController.text),
      urls: [],
      description: descriptionController.text,
      sightType: _chosenSightType!,
    );
    try {
      await context.read<SightInteractor>().addNewSight(sightForAdd);
      _showDialog(AppStrings.placeIsSaved, context);
    } catch (e) {
      _showDialog(AppStrings.placeDoesNotSave, context);
    }
    FocusScope.of(context).unfocus();
  }

  @override
  void pickCoordinateOnMap() {
    print(AppStrings.pickOnMap);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeState = Theme.of(context);
    _widthOfCoordinateTxtFields =
        (MediaQuery.of(context).size.width - (sideScreenPadding * 2 + spaceBetwenTextFields)) / 2;
  }

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    nameController.dispose();
    scrollController.dispose();
    descriptionNode.dispose();
    latitudeNode.dispose();
    longitudeNode.dispose();
    nameNode.dispose();
  }

  void _showDialog(String title, BuildContext context) {
    Text okTxt = Text(AppStrings.ok);
    Platform.isAndroid
        ? showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(title),
                actions: <Widget>[
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: okTxt,
                  ),
                ],
              );
            },
            barrierDismissible: true)
        : showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => CupertinoAlertDialog(
              title: Text(title),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: Navigator.of(context).pop,
                  child: okTxt,
                ),
              ],
            ),
          );
  }
}
