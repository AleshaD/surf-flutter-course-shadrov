import 'dart:io';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/enums/coordinate_type.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';
import 'add_sight_wm.dart';
import 'screen_widgets/add_sight_photo_list.dart';
import 'screen_widgets/app_text_form_field.dart';
import 'screen_widgets/coordinate_text_field.dart';

class AddSightWidget extends ElementaryWidget<IAddSightWidgetModel> {
  const AddSightWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultAddSightWidgetModelFactory,
  }) : super(wmFactory, key: key);

  double get _blockMarginSize => 24;

  @override
  Widget build(IAddSightWidgetModel wm) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(AppStrings.newPlace),
        leadingWidth: double.infinity,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: wm.popScreen,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                AppStrings.cancel,
                style: wm.theme.textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: wm.sideScreenPadding),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: wm.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EntityStateNotifierBuilder<List<File>>(
                      listenableEntityState: wm.filesForSightPhotos,
                      builder: (context, data) {
                        return AddSightPhotoList(
                          imageFiles: data!,
                          addNewPhotoPressed: wm.pickPhotoForSight,
                          onDeletePhoto: wm.removePhotoByPath,
                        );
                      },
                    ),
                    SizedBox(
                      height: _blockMarginSize,
                    ),
                    Text(
                      AppStrings.category.toUpperCase(),
                      style: wm.theme.textTheme.caption,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      onTap: wm.chooseSightTypeTaped,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EntityStateNotifierBuilder<String>(
                              listenableEntityState: wm.chosenSightTypeStr,
                              builder: (context, chosenSightTypeStr) {
                                return Text(
                                  chosenSightTypeStr!,
                                  style: wm.theme.textTheme.subtitle2!
                                      .copyWith(fontSize: 16),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Icon(
                                CustomIcons.view,
                                size: 24,
                                color: wm.theme.primaryColor,
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
                      key: wm.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextFormField(
                            name: AppStrings.title,
                            textController: wm.nameController,
                            focusNode: wm.nameNode,
                            validator: wm.nameValidator,
                            onChange: wm.checkIsCreateBtnActive,
                            onEditingComplete: () => wm.requestFocusTo(wm.latitudeNode),
                          ),
                          SizedBox(
                            height: _blockMarginSize,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: wm.widthOfCoordinateTxtFields,
                                child: CoordinateTextField(
                                  type: CoordinateType.latitude,
                                  textController: wm.latitudeController,
                                  focusNode: wm.latitudeNode,
                                  onChange: wm.checkIsCreateBtnActive,
                                  onEditingComplete: wm.onLatitudeEditingComplete,
                                ),
                              ),
                              SizedBox(
                                width: wm.spaceBetwenTextFields,
                              ),
                              SizedBox(
                                width: wm.widthOfCoordinateTxtFields,
                                child: CoordinateTextField(
                                  type: CoordinateType.longitude,
                                  textController: wm.longitudeController,
                                  focusNode: wm.longitudeNode,
                                  onChange: wm.checkIsCreateBtnActive,
                                  onEditingComplete: wm.onLongitudeEditingComplete,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            onPressed: wm.pickCoordinateOnMap,
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
                            textController: wm.descriptionController,
                            focusNode: wm.descriptionNode,
                            validator: wm.descriptionValidator,
                            onChange: wm.checkIsCreateBtnActive,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: EntityStateNotifierBuilder<bool>(
                    listenableEntityState: wm.isCreateBtnActive,
                    builder: (
                      context,
                      isActive,
                    ) {
                      return LargeAppButton(
                        isActive: isActive!,
                        onPressed: wm.createSight,
                        titleWidgets: [
                          Text(
                            AppStrings.create.toUpperCase(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
