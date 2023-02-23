import 'dart:io';

import 'package:elementary/elementary.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/ui/screen/add_sight_screen/screen_widgets/choose_category_screen.dart';
import 'package:places/ui/screen/pick_coordinate_on_map/pick_coordinate_on_map.dart';
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

  ListenableState<EntityState<List<File>>> get filesForSightPhotos;
  ListenableState<EntityState<String>> get chosenSightTypeStr;
  ListenableState<EntityState<bool>> get isCreateBtnActive;

  void popScreen();
  void removePhotoByPath(File path);
  void chooseSightTypeTaped();
  void checkIsCreateBtnActive();
  void requestFocusTo(FocusNode node);
  void onLatitudeEditingComplete();
  void onLongitudeEditingComplete();
  void createSight();
  void pickCoordinateOnMap();
  void pickPhotoForSight();
}

AddSightWidgetModel defaultAddSightWidgetModelFactory(BuildContext context) {
  final model = AddSightModel(
    sightRepository: context.read<SightRepository>(),
    imgRepo: context.read<SightImagesRepository>(),
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
  final ImagePicker _imagePicker = ImagePicker();

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

  final _filesForSightPhotosState = EntityStateNotifier<List<File>>(
    EntityState(
      data: [],
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
  ListenableState<EntityState<List<File>>> get filesForSightPhotos =>
      _filesForSightPhotosState;

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
  void removePhotoByPath(File file) {
    final currentFiles = _filesForSightPhotosState.value!.data!;
    currentFiles.removeWhere((cf) => cf == file);
    _filesForSightPhotosState.content(currentFiles);
  }

  @override
  void pickPhotoForSight() async {
    final source = await _chooseSourceInBottomSheetForNewPhoto();
    if (source != null) {
      final imges = await _pickImages(source);
      final alreadyPicked = _filesForSightPhotosState.value!.data!;
      alreadyPicked.addAll(imges);
      _filesForSightPhotosState.content(alreadyPicked);
    }
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
      await model.createSightWithPhotos(
        sightForAdd,
        _filesForSightPhotosState.value!.data!,
      );
      _showDialog(AppStrings.placeIsSaved, context);
    } catch (e) {
      _showDialog(AppStrings.placeDoesNotSave, context);
    }
    FocusScope.of(context).unfocus();
  }

  @override
  void pickCoordinateOnMap() async {
    final Coordinate? coordinate = await Navigator.of(context).push<Coordinate?>(
      MaterialPageRoute(
        builder: (context) {
          return PickCoordinateOnMap();
        },
      ),
    );
    if (coordinate != null) {
      longitudeController.text = coordinate.lng.toString();
      latitudeController.text = coordinate.lat.toString();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeState = Theme.of(context);
    _widthOfCoordinateTxtFields = (MediaQuery.of(context).size.width -
            (sideScreenPadding * 2 + spaceBetwenTextFields)) /
        2;
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

  Future<List<File>> _pickImages(PickPhotoSourceType sourceType) async {
    List<File> pickedImages = [];
    try {
      switch (sourceType) {
        case PickPhotoSourceType.camera:
          final XFile? img = await _imagePicker.pickImage(source: ImageSource.camera);
          if (img != null) pickedImages.add(File(img.path));
          break;
        case PickPhotoSourceType.gallery:
          final List<XFile> imges =
              await _imagePicker.pickMultiImage(requestFullMetadata: false);
          pickedImages.addAll(imges.map((xf) => File(xf.path)));
          break;
        case PickPhotoSourceType.file:
          FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
            type: FileType.image,
          );
          if (pickedFiles != null) {
            pickedImages.addAll(
              pickedFiles.files.where((f) => f.path != null).map(
                    (f) => File(f.path!),
                  ),
            );
          }
          break;
      }
    } on PlatformException catch (_) {
      if (Platform.isIOS)
        _showDialog(AppStrings.pleaseCheckCameraPermisions, context);
      else
        _showDialog(AppStrings.unknownError, context);
    } catch (e) {
      super.onErrorHandle(e);
    } finally {
      return pickedImages;
    }
  }

  Future<PickPhotoSourceType?> _chooseSourceInBottomSheetForNewPhoto() async {
    PickPhotoSourceType? fromSource = await showModalBottomSheet<PickPhotoSourceType>(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: AddPhotoPickSourcePage(),
        );
      },
    );
    return fromSource;
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
