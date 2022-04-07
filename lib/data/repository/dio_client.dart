import 'package:dio/dio.dart';

class DioClient {
  DioClient() {
    BaseOptions _options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: _defaultTimeoutMs,
      sendTimeout: _defaultTimeoutMs,
      receiveTimeout: _defaultTimeoutMs,
      responseType: ResponseType.json,
    );
    _dio = Dio(_options);
    _addIntrceptors();
  }

  late final Dio _dio;
  final int _defaultTimeoutMs = 5000;

  void _addIntrceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Dio Request: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('''Dio Response: ${response.realUri}
              \n statusCode: ${response.statusCode}
              \n ${response.data}''');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print('Dio request Error: ${e.error} \nmesage: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<List<dynamic>?> getUsers() async {
    try {
      var response = await _dio.get<List<dynamic>?>('/users');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ('Dio connection error');
      }
    } catch (e) {
      return null;
    }
  }
}
