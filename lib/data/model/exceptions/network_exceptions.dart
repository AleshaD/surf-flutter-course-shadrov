import 'package:dio/dio.dart';

class NetworkExceptions implements Exception {
  NetworkExceptions({
    required this.requestPath,
    required this.statusCode,
    required this.msgForUser,
    required this.exceptionName,
  });

  NetworkExceptions.fromDioError(DioError dioError, msgForUser)
      : requestPath = dioError.requestOptions.path,
        statusCode = dioError.response?.statusCode ?? 0,
        exceptionName = dioError.message,
        msgForUser = msgForUser;

  final String msgForUser;
  final String requestPath;
  final int statusCode;
  final String exceptionName;

  String get msgDebug => 'В запросе \'$requestPath\' произошла ошибка: $statusCode $exceptionName';

  @override
  String toString() => msgDebug;
}
