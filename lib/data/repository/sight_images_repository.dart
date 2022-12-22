import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class SightImagesRepository {
  SightImagesRepository(this._dio);

  SightImagesRepository.withDefaultDio()
      : this._dio = Dio(
          BaseOptions(
            connectTimeout: _dioTimeout,
            receiveTimeout: _dioTimeout,
            sendTimeout: _dioTimeout,
          ),
        );

  static SightImagesRepository instance = SightImagesRepository(
    Dio(
      BaseOptions(
        connectTimeout: _dioTimeout,
        receiveTimeout: _dioTimeout,
        sendTimeout: _dioTimeout,
      ),
    ),
  );

  final Dio _dio;
  static final _dioTimeout = 3000;
  final Map<String, File> _repositoryFileCach = {};

  Future<File?> getImage(String url) async {
    if (!_isImageUrl(url)) return null;

    try {
      return await _getImageFromTempDir(url);
    } catch (e) {
      return await _downloadImage(url);
    }
  }

  File? getImageSync(String url) {
    final name = _getImageName(url);

    return _repositoryFileCach[name];
  }

  Future<File> _getImageFromTempDir(String url) async {
    final tempPath = await _getDeviceTemproraryPathFor(fileFrom: url);
    try {
      final File file = File(tempPath);
      if (await File(tempPath).exists()) {
        final name = _getImageName(url);
        _addFileToRepoCashes(file, name);

        return File.fromUri(Uri.parse(tempPath));
      } else
        throw (Exception('file not exist'));
    } catch (e) {
      rethrow;
    }
  }

  Future<File?> _downloadImage(String url) async {
    final tempPath = await _getDeviceTemproraryPathFor(fileFrom: url);
    try {
      await _dio.download(url, tempPath);
      final file = File.fromUri(Uri.parse(tempPath));

      return file;
    } catch (e) {
      return null;
    }
  }

  Future<String> _getDeviceTemproraryPathFor({required String fileFrom}) async {
    final Directory tempDir = await getTemporaryDirectory();
    final imgName = _getImageName(fileFrom);

    return '${tempDir.path}/$imgName';
  }

  String _getImageName(String url) {
    return url.split('/').last;
  }

  bool _isImageUrl(String url) {
    return url.endsWith('.jpg') || url.endsWith('.jepg') || url.endsWith('.png');
  }

  void _addFileToRepoCashes(File file, String name) =>
      _repositoryFileCach.putIfAbsent(name, () => file);
}
