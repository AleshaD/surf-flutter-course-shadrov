import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_txt_styles.dart';

final lightTheme = ThemeData(
  primaryColor: lmMainColor,
  scaffoldBackgroundColor: lmWhiteColor,
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
    onSurface: lmInactiveBlack, // цвет для не активного элемента
    onBackground: lmSecondaryColor,
    onError: lmWhiteColor,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headline4: largeTitleStyle.apply(color: lmSecondaryColor),
    headline5: titleStyle.apply(color: lmSecondaryColor),
    headline6: subtitleStyle.apply(color: lmSecondaryColor),
    bodyText1: textStyle.apply(color: lmSecondaryColor),
    bodyText2: superSmallw400TxtStyle.apply(color: lmSecondaryColor),
    subtitle1: smallBoldTxtStyle.apply(color: lmWhiteColor),
    subtitle2: smallTxtStyle.apply(color: lmSecondaryColor2),
    button: buttonTxtStyle.apply(color: lmWhiteColor),
    caption: superSmallw400TxtStyle.apply(color: lmInactiveBlack),
  ),
  primaryTextTheme: TextTheme(
    subtitle1: smallBoldTxtStyle.apply(color: lmSecondaryColor),
    subtitle2: smallTxtStyle.apply(color: lmSecondaryColor),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: lmWhiteColor,
    shadowColor: Colors.transparent,
    elevation: 0,
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
  sliderTheme: SliderThemeData(
    trackHeight: 1,
    activeTrackColor: lmGreenColor,
    inactiveTrackColor: lmInactiveBlack,
    overlayShape: SliderComponentShape.noOverlay,
  ),
);

final darkTheme = ThemeData(
  primaryColor: dmMainColor,
  scaffoldBackgroundColor: dmMainColor,
  colorScheme: ColorScheme(
    primary: dmMainColor,
    primaryVariant: dmDarkColor,
    secondary: dmGreenColor,
    secondaryVariant: dmGreenColor,
    surface: dmMainColor,
    background: dmMainColor,
    error: dmErrorAndDeleteColor,
    onPrimary: dmWhiteColor,
    onSecondary: dmMainColor,
    onSurface: dmInactiveBlack, // цвет для не активного элемента
    onBackground: dmWhiteColor,
    onError: dmMainColor,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    headline4: largeTitleStyle.apply(color: dmWhiteColor),
    headline5: titleStyle.apply(color: dmWhiteColor),
    headline6: subtitleStyle.apply(color: dmWhiteColor),
    bodyText1: textStyle.apply(color: dmWhiteColor),
    bodyText2: superSmallw400TxtStyle.apply(color: dmSecondaryColor),
    subtitle1: smallBoldTxtStyle.apply(color: dmMainColor),
    subtitle2: smallTxtStyle.apply(color: dmSecondaryColor2),
    button: buttonTxtStyle.apply(color: dmWhiteColor),
    caption: superSmallw400TxtStyle.apply(color: dmInactiveBlack),
  ),
  primaryTextTheme: TextTheme(
    subtitle1: smallBoldTxtStyle.apply(color: dmSecondaryColor2),
    subtitle2: smallTxtStyle.apply(color: dmWhiteColor),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: dmMainColor,
    shadowColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: subtitleStyle.apply(color: dmWhiteColor),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: smallBoldTxtStyle,
    labelColor: dmMainColor,
    unselectedLabelStyle: smallBoldTxtStyle,
    unselectedLabelColor: dmInactiveBlack,
    indicator: ShapeDecoration.fromBoxDecoration(
      BoxDecoration(
        color: dmWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: dmMainColor,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: dmWhiteColor,
    unselectedItemColor: dmWhiteColor,
  ),
  dividerTheme: DividerThemeData(
    color: dmInactiveBlack,
  ),
  sliderTheme: SliderThemeData(
    trackHeight: 1,
    activeTrackColor: dmGreenColor,
    inactiveTrackColor: dmInactiveBlack,
    overlayShape: SliderComponentShape.noOverlay,
  ),
);
