import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/enums/coordinate_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/app_text_form_field.dart';
import 'package:places/ui/screen/add_sight_screen/coordinate_text_field.dart';
import 'package:places/ui/widgets/large_app_button.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _sideScreenPadding = 16;
  final double _spaceBetwenTextFields = 16;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    descriptionController.dispose();
    descriptionNode.dispose();
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
        longitudeController.text != '';

    // меняем стэйт виджета только если это необходимо
    if (canBeActive != _createBtnIsActive) {
      if (canBeActive && _formKey.currentState!.validate())
        _createBtnIsActive = true;
      else
        _createBtnIsActive = false;
      setState(() {});
    }
  }

  void _showOkDialog(String title, BuildContext context) {
    Text okTxt = Text('Ok');
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

  @override
  Widget build(BuildContext context) {
    final double widthOfCoordinateTxtFields =
        (MediaQuery.of(context).size.width - (_sideScreenPadding * 2 + _spaceBetwenTextFields)) / 2;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Новое место'),
        leadingWidth: double.infinity,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Отмена',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _sideScreenPadding),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _blockMarginSize,
                  ),
                  Text(
                    'КАТЕГОРИЯ',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: () => print('Chose category'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Не выбрано',
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
                          name: 'Название',
                          textController: nameController,
                          focusNode: nameNode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Введите название места';
                            }
                          },
                          onChange: _changeCreateBtnState,
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(longitudeNode),
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
                                type: CoordinateType.longitude,
                                textController: longitudeController,
                                focusNode: longitudeNode,
                                onChange: _changeCreateBtnState,
                                onEditingComplete: () {
                                  if (latitudeController.text == '')
                                    FocusScope.of(context).requestFocus(latitudeNode);
                                },
                              ),
                            ),
                            SizedBox(
                              width: _spaceBetwenTextFields,
                            ),
                            SizedBox(
                              width: widthOfCoordinateTxtFields,
                              child: CoordinateTextField(
                                type: CoordinateType.latitude,
                                textController: latitudeController,
                                focusNode: latitudeNode,
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
                          onPressed: () => print('Указать на карте'),
                          child: Text(
                            'Указать на карте',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 37,
                        ),
                        AppTextFormField(
                          name: 'Описание',
                          hint: 'введите текст',
                          textController: descriptionController,
                          focusNode: descriptionNode,
                          textInputType: TextInputType.multiline,
                          showClearTxtBtn: false,
                          maxLines: 4,
                          onEditingComplete: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: LargeAppButton(
                  isActive: _createBtnIsActive,
                  onPressed: () {
                    _formKey.currentState!.validate();
                    sightMocks.add(
                      Sight(
                        name: nameController.text,
                        lat: double.parse(latitudeController.text),
                        lon: double.parse(longitudeController.text),
                        url: '',
                        details: descriptionController.text,
                        type: SightType.museum,
                      ),
                    );
                    _showOkDialog('Место сохранено', context);
                    FocusScope.of(context).unfocus();
                  },
                  titleWidgets: [
                    Text(
                      'Создать'.toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
