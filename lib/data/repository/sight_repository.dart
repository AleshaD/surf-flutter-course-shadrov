import 'dart:io';

import 'package:dio/dio.dart';
import 'package:places/data/model/sights/sight_dto.dart';
import 'package:places/data/model/sights/sights_filter_request_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../model/sight.dart';

part 'sight_repository.g.dart';

@RestApi(baseUrl: 'https://test-backend-flutter.surfstudio.ru')
abstract class SightRepository {
  factory SightRepository(Dio dio, {String baseUrl}) = _SightRepository;

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

  @POST('/upload_file')
  Future<String> mediaUpload(@Part() File file);

  @GET('/files/{path}')
  Future<String> fetchFile(@Path() String path);

  @GET('/client/{path}')
  Future<String> fetchClientFile(@Path() String path);
}
