import 'dart:io';

import 'package:dio/dio.dart';
import 'package:places/data/model/sights/sight_dto.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';

import '../model/sights/sight.dart';

part 'sights_api.g.dart';

const String surfBaseUrl = 'https://test-backend-flutter.surfstudio.ru';

@RestApi(baseUrl: surfBaseUrl)
abstract class SightsApi {
  factory SightsApi(Dio dio, {String baseUrl}) = _SightsApi;

  static const String baseUrl = surfBaseUrl;

  @POST('/filtered_places')
  Future<List<SightDto>> getFilteredSights(@Body() SightsFilterRequestDto filter);

  @POST('/place')
  Future<Sight> createSight(@Body() Sight sight);

  @GET('/place')
  Future<List<Sight>> getSights(@Queries() Map<String, dynamic> queryParametrs);

  @GET('/place/{id}')
  Future<Sight> getSight(@Path() int id);

  @DELETE('/place/{id}')
  Future<void> deleteSight(@Path() int id);

  @PUT('/place/{id}')
  Future<Sight> updateSight(@Path() int id, @Body() Map<String, dynamic> updateData);

  /// Сохранение файлов в хранилище.
  /// В ответ приходит путь к загруженному файлу, относительно текущего домена.
  /// Данные передаются в multipart/form-data
  /// Допустимые типы файлов: jpg, png, gif, svg.
  /// Если загружен один файл, то путь к нему содержится в заголовке "location".
  /// Если в запросе было больше одного файла, то ответ в виде списка путей к загруженным файлам в теле ответа.
  /// Загружаем только один файл
  @POST('/upload_file')
  Future<HttpResponse<String>> mediaUpload(@Part(contentType: 'image/jpeg') File file);

  @GET('/files/{path}')
  Future<String> fetchFile(@Path() String path);

  @GET('/client/{path}')
  Future<String> fetchClientFile(@Path() String path);
}
