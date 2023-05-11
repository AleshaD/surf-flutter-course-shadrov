import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/screen/add_sight_screen/screen_widgets/pick_photo_source_row.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';

enum PickPhotoSourceType {
  camera,
  gallery,
  file,
}

class AddPhotoPickSourcePage extends StatelessWidget {
  const AddPhotoPickSourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    PickPhotoSourceRow(
                      CustomIcons.camera,
                      AppStrings.camera,
                      () => Navigator.of(context).pop(PickPhotoSourceType.camera),
                    ),
                    Divider(),
                    PickPhotoSourceRow(
                      CustomIcons.photo,
                      AppStrings.photo,
                      () => Navigator.of(context).pop(PickPhotoSourceType.gallery),
                    ),
                    Divider(),
                    PickPhotoSourceRow(
                      CustomIcons.fail,
                      AppStrings.file,
                      () => Navigator.of(context).pop(PickPhotoSourceType.file),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).scaffoldBackgroundColor),
                      ),
                ),
              ),
              child: LargeAppButton(
                onPressed: () => Navigator.of(context).pop(),
                titleWidgets: [
                  Text(
                    AppStrings.cancel.toUpperCase(),
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
