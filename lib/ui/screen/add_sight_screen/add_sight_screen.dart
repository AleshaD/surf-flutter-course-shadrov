import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/enums/coordinate_type.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/add_photo_pick_source_page.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_photo_list.dart';
import 'package:places/ui/screen/add_sight_screen/app_text_form_field.dart';
import 'package:places/ui/screen/add_sight_screen/choose_category_screen.dart';
import 'package:places/ui/screen/add_sight_screen/coordinate_text_field.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionNode = FocusNode();
  final TextEditingController latitudeController = TextEditingController();
  final FocusNode latitudeNode = FocusNode();
  final TextEditingController longitudeController = TextEditingController();
  final FocusNode longitudeNode = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  final double _blockMarginSize = 24;
  bool _createBtnIsActive = false;
  SightType? chosenCategory;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _sideScreenPadding = 16;
  final double _spaceBetwenTextFields = 16;

  List<String> pathsToSightPhotos = mockImagesPaths.toList();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    descriptionController.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    descriptionNode.addListener(() {
      if (descriptionNode.hasFocus) {
        // при фокусе на поле описания переводим скролл наверх,
        // чтобы открыть кнопку создания места если она скрыта.
        // таймер чтобы подождать когда клавиатура выедет полностью
        Timer(Duration(milliseconds: 300), () {
          scrollController.animateTo(
            scrollController.offset + scrollController.position.extentAfter,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 150),
          );
        });
      }
    });
  }

  void _changeCreateBtnState() {
    bool canBeActive = nameController.text != '' &&
        latitudeController.text != '' &&
        longitudeController.text != '' &&
        descriptionController.text != '' &&
        chosenCategory != null;

    // меняем стэйт виджета только если это необходимо
    if (canBeActive != _createBtnIsActive) {
      setState(() {
        canBeActive && _formKey.currentState!.validate()
            ? _createBtnIsActive = true
            : _createBtnIsActive = false;
      });
    }
  }

  void _showOkDialog(String title, BuildContext context) {
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

  void _addNewSightPhoto() async {
    PickPhotoSourceType? fromSource = await showModalBottomSheet<PickPhotoSourceType>(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: AddPhotoPickSourcePage());
      },
    );
    if (fromSource != null) print('pick from $fromSource');
  }

  void _removePhotoByPath(String path) {
    setState(() {
      pathsToSightPhotos.removeWhere((photoPath) => photoPath == path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double widthOfCoordinateTxtFields =
        (MediaQuery.of(context).size.width - (_sideScreenPadding * 2 + _spaceBetwenTextFields)) / 2;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(AppStrings.newPlace),
        leadingWidth: double.infinity,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                AppStrings.cancel,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _sideScreenPadding),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddSightPhotoList(
                      imagePaths: pathsToSightPhotos,
                      addNewPhotoPressed: _addNewSightPhoto,
                      onDeletePhoto: _removePhotoByPath,
                    ),
                    SizedBox(
                      height: _blockMarginSize,
                    ),
                    Text(
                      AppStrings.category.toUpperCase(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => ChooseCategoryScreen(
                                  initCategory: chosenCategory,
                                ),
                              ),
                            )
                            .then(
                              (value) => setState(
                                () {
                                  if (value != null) {
                                    if (value is SightType) {
                                      chosenCategory = value;
                                      _changeCreateBtnState();
                                    }
                                  }
                                },
                              ),
                            );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chosenCategory == null
                                  ? AppStrings.noPick
                                  : Place.getTypeNameBy(chosenCategory!),
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Icon(
                                CustomIcons.view,
                                size: 24,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: _blockMarginSize,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextFormField(
                            name: AppStrings.title,
                            textController: nameController,
                            focusNode: nameNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.enterTheTitle;
                              }

                              return null;
                            },
                            onChange: _changeCreateBtnState,
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(latitudeNode),
                          ),
                          SizedBox(
                            height: _blockMarginSize,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: widthOfCoordinateTxtFields,
                                child: CoordinateTextField(
                                  type: CoordinateType.latitude,
                                  textController: latitudeController,
                                  focusNode: latitudeNode,
                                  onChange: _changeCreateBtnState,
                                  onEditingComplete: () {
                                    if (longitudeController.text == '')
                                      FocusScope.of(context).requestFocus(longitudeNode);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: _spaceBetwenTextFields,
                              ),
                              SizedBox(
                                width: widthOfCoordinateTxtFields,
                                child: CoordinateTextField(
                                  type: CoordinateType.longitude,
                                  textController: longitudeController,
                                  focusNode: longitudeNode,
                                  onChange: _changeCreateBtnState,
                                  onEditingComplete: () {
                                    if (descriptionController.text == '')
                                      FocusScope.of(context).requestFocus(descriptionNode);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            onPressed: () => print(AppStrings.pickOnMap),
                            child: Text(
                              AppStrings.pickOnMap,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 37,
                          ),
                          AppTextFormField(
                            name: AppStrings.description,
                            hint: AppStrings.enterTheText.toLowerCase(),
                            textController: descriptionController,
                            focusNode: descriptionNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.enterTheDescription;
                              }

                              return null;
                            },
                            onChange: _changeCreateBtnState,
                            textInputType: TextInputType.multiline,
                            showClearTxtBtn: false,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 76,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: LargeAppButton(
                  isActive: _createBtnIsActive,
                  onPressed: () {
                    _formKey.currentState!.validate();
                    sightMocks.insert(
                      0,
                      Place.onCreate(
                        name: nameController.text,
                        lat: double.parse(latitudeController.text),
                        lon: double.parse(longitudeController.text),
                        urls: [],
                        description: descriptionController.text,
                        placeType: chosenCategory!,
                      ),
                    );
                    _showOkDialog(AppStrings.placeIsSaved, context);
                    FocusScope.of(context).unfocus();
                  },
                  titleWidgets: [
                    Text(
                      AppStrings.create.toUpperCase(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
