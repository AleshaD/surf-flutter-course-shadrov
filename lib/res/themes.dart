import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_txt_styles.dart';

final lightTheme = ThemeData(
  primaryColor: lmWhiteColor,
  primaryColorDark: lmSecondaryColor,
  secondaryHeaderColor: lmSecondaryColor,
  backgroundColor: lmWhiteColor,
  scaffoldBackgroundColor: lmWhiteColor,
  errorColor: lmErrorAndDeleteColor,
  textTheme: TextTheme(
    headline4: largeTitleStyle.apply(color: lmSecondaryColor),
    headline5: titleStyle,
    headline6: subtitleStyle,
    bodyText1: textStyle,
    subtitle1: smallBoldTxtStyle,
    subtitle2: smallTxtStyle,
    button: buttonTxtStyle,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.amber,
    ),
  ),
);
