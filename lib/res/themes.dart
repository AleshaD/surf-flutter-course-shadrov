import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_txt_styles.dart';

final lightTheme = ThemeData(
  primaryColor: lmWhiteColor,
  colorScheme: ColorScheme(
    primary: lmWhiteColor,
    primaryVariant: lmBackgroundColor,
    secondary: lmSecondaryColor,
    secondaryVariant: lmSecondaryColor2,
    surface: lmWhiteColor,
    background: lmWhiteColor,
    error: lmErrorAndDeleteColor,
    onPrimary: lmSecondaryColor,
    onSecondary: lmWhiteColor,
    onSurface: lmSecondaryColor,
    onBackground: lmSecondaryColor,
    onError: lmWhiteColor,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headline4: largeTitleStyle.apply(color: lmSecondaryColor),
    headline5: titleStyle,
    headline6: subtitleStyle,
    bodyText1: textStyle.apply(color: lmSecondaryColor),
    subtitle1: smallBoldTxtStyle.apply(color: lmWhiteColor),
    subtitle2: smallTxtStyle.apply(color: lmSecondaryColor2),
    button: buttonTxtStyle,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: subtitleStyle.apply(color: lmSecondaryColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lmWhiteColor,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: lmSecondaryColor,
    unselectedItemColor: lmSecondaryColor,
  ),
);
