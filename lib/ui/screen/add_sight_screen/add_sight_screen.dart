import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/app_text_form_field.dart';

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final double _blockMarginSize = 24;
  final double _sideScreenPadding = 16;
  final double _spaceBetwenTextFields = 16;
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameNode = FocusNode();
  final TextEditingController latitudeController = TextEditingController();
  final FocusNode latitudeNode = FocusNode();
  final TextEditingController longitudeController = TextEditingController();
  final FocusNode longitudeNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final double widthOfCoordinateTxtFields =
        (MediaQuery.of(context).size.width - (_sideScreenPadding * 2 + _spaceBetwenTextFields)) / 2;
    return Scaffold(
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
            AppTextFormField(
              name: 'Название',
              textController: nameController,
              focusNode: nameNode,
              onEditingComplete: () => FocusScope.of(context).requestFocus(longitudeNode),
            ),
            SizedBox(
              height: _blockMarginSize,
            ),
            Row(
              children: [
                SizedBox(
                  width: widthOfCoordinateTxtFields,
                  child: AppTextFormField(
                    name: 'Широта',
                    textController: longitudeController,
                    focusNode: longitudeNode,
                    textInputType: TextInputType.number,
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
                  child: AppTextFormField(
                    name: 'Долгота',
                    textController: latitudeController,
                    focusNode: latitudeNode,
                    textInputType: TextInputType.number,
                    onEditingComplete: () {
                      if (longitudeController.text == '')
                        FocusScope.of(context).requestFocus(longitudeNode);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
