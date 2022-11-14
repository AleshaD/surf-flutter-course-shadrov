import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';

class ChooseCategoryScreen extends StatefulWidget {
  const ChooseCategoryScreen({
    this.initCategory,
  });

  final SightType? initCategory;

  @override
  _ChooseCategoryScreenState createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  SightType? choosen;

  @override
  void initState() {
    super.initState();
    choosen = widget.initCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(
          AppStrings.category,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ...SightType.values
                  .map((type) => Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(right: 16),
                            dense: true,
                            onTap: () => setState(() {
                              choosen = type;
                            }),
                            leading: Text(
                              Sight.getTypeNameBy(type),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Theme.of(context).primaryColor),
                            ),
                            trailing: choosen != null && type == choosen
                                ? Icon(
                                    CustomIcons.tick,
                                    color: Theme.of(context).colorScheme.secondary,
                                  )
                                : null,
                          ),
                          Divider(),
                        ],
                      ))
                  .toList(),
              Spacer(),
              LargeAppButton(
                isActive: choosen != null,
                onPressed: () => Navigator.pop(context, choosen),
                titleWidgets: [
                  Text(
                    AppStrings.save.toUpperCase(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
