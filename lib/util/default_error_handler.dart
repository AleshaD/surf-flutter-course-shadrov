import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

class DefaultErrorHandler implements ErrorHandler {
  @override
  void handleError(
    Object error, {
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      print(error);
    } else {
      //send to crashlytics
      print(error);
    }
  }
}
