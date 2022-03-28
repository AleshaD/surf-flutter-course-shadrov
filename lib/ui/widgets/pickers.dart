import 'package:flutter/material.dart';
import 'package:places/main.dart';

class Pickers {
  static final locale = Locale("ru", "RU");
  static Future<DateTime?> pickDate(BuildContext context) {
    return showDatePicker(
      context: context,
      locale: locale,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 730),
      ),
      builder: (context, child) {
        return Theme(
          data: context.findAncestorStateOfType<AppState>()!.appThemeConfig.datePickerTheme,
          child: child!,
        );
      },
    );
  }

  static Future<TimeOfDay?> pickTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 0),
      builder: (context, child) {
        return Theme(
          data: context.findAncestorStateOfType<AppState>()!.appThemeConfig.datePickerTheme,
          child: child!,
        );
      },
    );
  }

  static Future<DateTime?> pickDateAndAfterTime(BuildContext context) async {
    DateTime? date = await pickDate(context);
    if (date == null) return null;

    TimeOfDay? time = await pickTime(context);
    if(time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
