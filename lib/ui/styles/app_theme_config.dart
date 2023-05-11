import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_txt_styles.dart';
import 'package:places/data/model/enums/theme_type.dart';

class AppThemeConfig {
  AppThemeConfig(this._type);

  AppThemeConfig.dark() : this._type = ThemeType.dark;

  AppThemeConfig.light() : this._type = ThemeType.light;

  final ThemeType _type;
  ThemeType get type => _type;

  bool get isLight => type == ThemeType.light;
  bool get isDark => type == ThemeType.dark;

  Color get greenClr => isLight ? lmGreenColor : dmGreenColor;
  Color get errorClr => isLight ? lmErrorAndDeleteColor : dmErrorAndDeleteColor;
  Color get mainClr => isLight ? lmMainColor : dmMainColor;
  Color get secondaryClr => isLight ? lmSecondaryColor : dmSecondaryColor;
  Color get secondaryClr2 => isLight ? lmSecondaryColor2 : dmSecondaryColor2;
  Color get inactiveClr => isLight ? lmInactiveBlack : dmInactiveBlack;
  Color get whiteClr => isLight ? lmWhiteColor : dmWhiteColor;
  Color get yellowClr => isLight ? lmYellowColor : dmYellowColor;
  Color get backgroundClr =>
      isLight ? lmBackgroundColor : dmDarkColor; // в тёмной теме нету

  Color get lightSecondaryDarkIsWhite => isLight ? secondaryClr : whiteClr;
  Color get lightWhiteDarkIsMain => isLight ? whiteClr : mainClr;

  ThemeData get data => ThemeData(
        primaryColor: isLight ? mainClr : whiteClr,
        scaffoldBackgroundColor: lightWhiteDarkIsMain,
        colorScheme: ColorScheme(
          primary: lightWhiteDarkIsMain,
          primaryContainer: backgroundClr,
          secondary: greenClr,
          secondaryContainer: yellowClr,
          surface: lightWhiteDarkIsMain,
          background: lightWhiteDarkIsMain,
          error: errorClr,
          onPrimary: isLight ? secondaryClr : whiteClr,
          onSecondary: lightWhiteDarkIsMain,
          onSurface: inactiveClr,
          onBackground: lightSecondaryDarkIsWhite,
          onError: lightWhiteDarkIsMain,
          onTertiaryContainer: secondaryClr2,
          brightness: isLight ? Brightness.light : Brightness.dark,
        ),
        textTheme: TextTheme(
          headline3:
              textStyle.copyWith(fontWeight: FontWeight.w500, color: secondaryClr2),
          headline4: largeTitleStyle.apply(color: lightSecondaryDarkIsWhite),
          headline5: titleStyle.apply(color: lightSecondaryDarkIsWhite),
          headline6: subtitleStyle.apply(color: lightSecondaryDarkIsWhite),
          bodyText1: textStyle.apply(color: lightSecondaryDarkIsWhite),
          bodyText2: superSmallw400TxtStyle.apply(color: lightSecondaryDarkIsWhite),
          subtitle1: smallBoldTxtStyle.apply(color: lightWhiteDarkIsMain),
          subtitle2: smallTxtStyle.apply(color: secondaryClr2),
          button: buttonTxtStyle.apply(color: whiteClr),
          caption: superSmallw400TxtStyle.apply(color: inactiveClr),
        ),
        primaryTextTheme: TextTheme(
          subtitle1:
              smallBoldTxtStyle.apply(color: isLight ? secondaryClr : secondaryClr2),
          subtitle2: smallTxtStyle.apply(color: isLight ? secondaryClr : whiteClr),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: lightWhiteDarkIsMain,
          shadowColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: subtitleStyle.apply(color: lightSecondaryDarkIsWhite),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: smallBoldTxtStyle,
          labelColor: lightWhiteDarkIsMain,
          unselectedLabelStyle: smallBoldTxtStyle,
          unselectedLabelColor: inactiveClr,
          indicator: ShapeDecoration.fromBoxDecoration(
            BoxDecoration(
              color: lightSecondaryDarkIsWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightWhiteDarkIsMain,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: lightSecondaryDarkIsWhite,
          unselectedItemColor: lightSecondaryDarkIsWhite,
        ),
        dividerTheme: DividerThemeData(
          color: inactiveClr,
          indent: 0,
          endIndent: 0,
          space: 0,
        ),
        sliderTheme: _sliderThemeDataBuilder(thumbClr: isLight ? null : whiteClr),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(isLight ? greenClr : whiteClr),
          trackColor: MaterialStateProperty.resolveWith((states) {
            Color selectedColor = isLight ? greenClr.withAlpha(80) : greenClr;

            return states.contains(MaterialState.selected) ? selectedColor : inactiveClr;
          }),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: lightSecondaryDarkIsWhite,
          selectionColor: lightSecondaryDarkIsWhite.withAlpha(30),
          selectionHandleColor: lightSecondaryDarkIsWhite.withAlpha(90),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          enabledBorder: _outlineInputBorderBuilder(),
          focusedBorder: _outlineInputBorderBuilder(borderWidth: 2),
          errorBorder: _outlineInputBorderBuilder(borderSideClr: errorClr),
          focusedErrorBorder:
              _outlineInputBorderBuilder(borderSideClr: errorClr, borderWidth: 2),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          suffixIconColor: mainClr,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
              (states) => textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return inactiveClr;
              } else if (states.contains(MaterialState.pressed)) {
                return greenClr.withAlpha(70);
              } else {
                return greenClr;
              }
            }),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            alignment: Alignment.centerLeft,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.disabled) ? inactiveClr : whiteClr;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.disabled) ? backgroundClr : greenClr;
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(50, 48),
            ),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      );

  ThemeData get datePickerTheme => data.copyWith(
      colorScheme: data.colorScheme.copyWith(
        primary: mainClr,
        onPrimary: whiteClr,
        onSurface: isLight ? secondaryClr2 : whiteClr,
      ),
      textTheme: data.textTheme.copyWith(
        subtitle1: smallBoldTxtStyle.apply(color: lightSecondaryDarkIsWhite),
      ));

  SliderThemeData _sliderThemeDataBuilder({Color? thumbClr}) => SliderThemeData(
        trackHeight: 1,
        thumbColor: thumbClr,
        activeTrackColor: greenClr,
        inactiveTrackColor: inactiveClr,
        overlayShape: SliderComponentShape.noOverlay,
      );

  OutlineInputBorder _outlineInputBorderBuilder(
      {Color? borderSideClr, double borderWidth = 1.0}) {
    borderSideClr = borderSideClr ?? greenClr.withAlpha(40);

    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: borderSideClr,
        width: borderWidth,
      ),
    );
  }
}
