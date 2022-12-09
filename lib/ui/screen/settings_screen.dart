import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/res/app_theme_config.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/app/app.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppThemeConfig currentTheme = AppThemeConfig.light();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentTheme = context.findAncestorStateOfType<AppState>()!.currentThemeConfig;
  }

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
                value: currentTheme.isDark,
                onChanged: (bool isDark) => setState(
                  () {
                    context.findAncestorStateOfType<AppState>()!.changeTheme(isDark);
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
