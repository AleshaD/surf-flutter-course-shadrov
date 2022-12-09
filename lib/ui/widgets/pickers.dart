import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/widgets/buttons/cupertino_simple_app_button.dart';

class Pickers {
  static final _locale = Locale("ru", "RU");

  static DateTime _initialDate() => DateTime.now();

  static DateTime _minimumDate() => DateTime.now().subtract(Duration(hours: 1));

  static DateTime _maximumDate() => DateTime.now().add(Duration(days: 365));

  static Future<DateTime?> pickDateAndTime(BuildContext context) {
    return Platform.isIOS ? _iosPickDateAndTime(context) : _androidPickDateAndAfterTime(context);
  }

  static Future<DateTime?> _iosPickDateAndTime(BuildContext context) {
    DateTime? pickedDate;

    return showModalBottomSheet<DateTime?>(
      context: context,
      isDismissible: true,
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: MediaQuery.of(context).padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoSimpleAppButton(
                      AppStrings.cancel,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    CupertinoSimpleAppButton(
                      AppStrings.ok,
                      onPressed: () => Navigator.of(context).pop(pickedDate),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: CupertinoDatePicker(
                    initialDateTime: _initialDate(),
                    minimumDate: _minimumDate(),
                    maximumDate: _maximumDate(),
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (changedDate) {
                      pickedDate = changedDate;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<DateTime?> _androidPickDateAndAfterTime(BuildContext context) async {
    DateTime? date = await _androidPickDate(context);
    if (date == null) return null;

    TimeOfDay? time = await _androidPickTime(context);
    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static Future<DateTime?> _androidPickDate(BuildContext context) {
    return showDatePicker(
      context: context,
      locale: _locale,
      initialDate: _initialDate(),
      firstDate: _minimumDate(),
      lastDate: _maximumDate(),
      builder: (context, child) {
        return Theme(
          data: context.findAncestorStateOfType<AppState>()!.currentThemeConfig.datePickerTheme,
          child: child!,
        );
      },
    );
  }

  static Future<TimeOfDay?> _androidPickTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 0),
      builder: (context, child) {
        return Theme(
          data: context.findAncestorStateOfType<AppState>()!.currentThemeConfig.datePickerTheme,
          child: child!,
        );
      },
    );
  }
}
