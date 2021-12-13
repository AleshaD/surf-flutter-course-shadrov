import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_txt_styles.dart';

final lightTheme = ThemeData(
  primaryColor: lmWhiteColor,
  colorScheme: ColorScheme(
    primary: lmWhiteColor,
    primaryVariant: lmBackgroundColor,
    secondary: lmGreenColor,
    secondaryVariant: lmGreenColor,
    surface: lmWhiteColor,
    background: lmWhiteColor,
    error: lmErrorAndDeleteColor,
    onPrimary: lmSecondaryColor,
    onSecondary: lmWhiteColor,
    onSurface: lmInactiveBlack,
    onBackground: lmSecondaryColor,
    onError: lmWhiteColor,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headline4: largeTitleStyle.apply(color: lmSecondaryColor),
    headline5: titleStyle.apply(color: lmSecondaryColor),
    headline6: subtitleStyle.apply(color: lmSecondaryColor),
    bodyText1: textStyle.apply(color: lmSecondaryColor),
    subtitle1: smallBoldTxtStyle.apply(color: lmWhiteColor),
    subtitle2: smallTxtStyle.apply(color: lmSecondaryColor2),
    button: buttonTxtStyle,
  ),
  primaryTextTheme: TextTheme(
    subtitle1: smallBoldTxtStyle.apply(color: lmSecondaryColor),
    subtitle2: smallTxtStyle.apply(color: lmSecondaryColor),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: lmWhiteColor,
    shadowColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: subtitleStyle.apply(color: lmSecondaryColor),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: smallBoldTxtStyle,
    labelColor: lmWhiteColor,
    unselectedLabelStyle: smallBoldTxtStyle,
    unselectedLabelColor: lmInactiveBlack,
    indicator: ShapeDecoration.fromBoxDecoration(
      BoxDecoration(
        color: lmSecondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lmWhiteColor,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: lmSecondaryColor,
    unselectedItemColor: lmSecondaryColor,
  ),
  dividerTheme: DividerThemeData(
    color: lmInactiveBlack,
  ),
);
