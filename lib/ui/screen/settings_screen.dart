import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/main.dart';
import 'package:places/styles/custom_icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.setting),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 42, right: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              leading: Text(
                AppStrings.darkTheme,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Switch.adaptive(
                value: darkTheme,
                onChanged: (bool newVal) => setState(
                  () {
                    darkTheme = newVal;
                    // на данном этапе сделал смену через контекст, вдидится это временное решение попроще
                    context.findAncestorStateOfType<AppState>()!.changeTheme(darkTheme);
                  },
                ),
              ),
            ),
            Divider(),
            ListTile(
                onTap: () => print('См туториал'),
                leading: Text(
                  AppStrings.lookTutorial,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    CustomIcons.info,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )),
            Divider(),
          ],
        ),
      ),
    );
  }
}
