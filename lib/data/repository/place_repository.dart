import 'dart:io';

import 'package:dio/dio.dart';
import 'package:places/data/model/places/place.dart';
import 'package:places/data/model/places/place_dto.dart';
import 'package:places/data/model/places/places_filter_request_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'place_repository.g.dart';

@RestApi(baseUrl: 'https://test-backend-flutter.surfstudio.ru')
abstract class PlaceRepository {
  factory PlaceRepository(Dio dio, {String baseUrl}) = _PlaceRepository;

  @POST('/filtered_places')
  Future<List<PlaceDto>> getFilteredPlaces(@Body() PlacesFilterRequestDto filter);

  @POST('/place')
  Future<Place> createPlace(@Body() Place place);

  @GET('/place')
  Future<List<Place>> getPlaces(@Queries() Map<String, dynamic> queryParametrs);

  @GET('/place/{id}')
  Future<Place> getPlace(@Path() int id);

  @DELETE('/place/{id}')
  Future<void> deletePlace(@Path() int id);

  @PUT('/place/{id}')
  Future<Place> updatePlace(@Path() int id, @Body() Map<String, dynamic> updateData);

  @POST('/upload_file')
  Future<String> mediaUpload(@Part() File file);

  @GET('/files/{path}')
  Future<String> fetchFile(@Path() String path);

  @GET('/client/{path}')
  Future<String> fetchClientFile(@Path() String path);
}
