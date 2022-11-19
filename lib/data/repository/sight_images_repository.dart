import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class SightImagesRepository {
  SightImagesRepository(this._dio);

  static SightImagesRepository instance = SightImagesRepository(
    Dio(
      BaseOptions(
        connectTimeout: 3000,
        receiveTimeout: 3000,
        sendTimeout: 3000,
      ),
    ),
  );

  final Dio _dio;

  Future<File?> getImage(String url) async {
    try {
      final file = await _getImageFromTempDir(url);
      return file;
    } catch (e) {
      final File? downloadedFile = await _downloadImage(url);
      return downloadedFile;
    }
  }

  Future<File> _getImageFromTempDir(String url) async {
    final tempPath = await _getDeviceTemproraryPathFor(fileFrom: url);
    try {
      if (await File(tempPath).exists()) {
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
}
