import 'dart:io';

import 'package:elementary/elementary.dart';
import 'package:places/data/repository/sight_images_repository.dart';
import 'package:places/data/repository/sight_repository.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/model/sights/sight.dart';

class AddSightModel extends ElementaryModel {
  AddSightModel({
    required SightRepository sightRepository,
    required SightImagesRepository imgRepo,
  })  : this._sightRepository = sightRepository,
        this._imageRepository = imgRepo,
        super();
  final SightRepository _sightRepository;
  final SightImagesRepository _imageRepository;
  final _maxReCreateAttempts = 3;
  int _reCreateAttempts = 0;

  Future<Sight> createSightWithPhotos(Sight sight, List<File> photoFiles) async {
    try {
      final List<String> urls = await _loadFilesAndGetUrls(photoFiles);
      print(urls);
      return await _addNewSight(sight.copyWith(urls: urls));
    } catch (e) {
      rethrow;
    }
  }

  Future<Sight> _addNewSight(Sight sight) async {
    try {
      final createdSight = await _sightRepository.addNewSight(
        sight,
      );
      _reCreateAttempts = 0;

      return createdSight;
    } on NetworkExceptions catch (e) {
      // 409 -> место уже существует, пробуем пересоздать с другим id
      if (e.statusCode == 409 && _reCreateAttempts < _maxReCreateAttempts) {
        _reCreateAttempts++;

        return _addNewSight(
          _sightWithNewId(sight),
        );
      } else {
        rethrow;
      }
    } on Object catch (_) {
      rethrow;
    }
  }

  Sight _sightWithNewId(Sight sight) => Sight.onCreate(
      name: sight.name,
      lat: sight.lat,
      lng: sight.lng,
      urls: sight.urls,
      description: sight.description,
      sightType: sight.sightType);

  Future<List<String>> _loadFilesAndGetUrls(List<File> photoFiles) async {
    final urls = <String>[];
    await for (var url in _imageRepository.uploadPhotos(photoFiles)) {
      urls.add(url);
    }
    return urls;
  }
}
