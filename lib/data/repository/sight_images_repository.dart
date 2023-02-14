import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/exceptions/network_exceptions.dart';
import 'package:places/data/providers/sights_api.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class SightImagesRepository {
  SightImagesRepository(this._dio, this._sightsApi);

  SightImagesRepository.withDefaultDio(this._sightsApi)
      : this._dio = Dio(
          BaseOptions(
            connectTimeout: _dioTimeout,
            receiveTimeout: _dioTimeout,
            sendTimeout: _dioTimeout,
          ),
        );

  final Dio _dio;
  final SightsApi _sightsApi;
  static final _dioTimeout = 10000;
  final Map<String, File> _repositoryFileCach = {};

  Future<File?> getImage(String url) async {
    if (!_isImageUrl(url)) return null;

    File? file;
    try {
      file = await _getImageFromTempDir(url);
    } catch (e) {
      file = await _downloadImage(url);
    }

    if (file != null) {
      _addFileToRepoCashes(file, _getImageName(url));
    }

    return file;
  }

  File? getImageSync(String url) {
    final name = _getImageName(url);
    final file = _repositoryFileCach[name];

    return file;
  }

  Stream<String> uploadPhotos(List<File> files) async* {
    for (var f in files) {
      if (_supportedPhotoExtension(f)) {
        if (_photoSizeMoreThenAvailable(f)) {
          final compresedFile = await _compressPhotoToAvailableSize(f);
          if (compresedFile != null)
            f = compresedFile;
          else
            continue; // файл который не удалось сжать, не загружаем
        }
        yield await _upLoadFile(f);
      }
    }
  }

  Future<String> _upLoadFile(File file) async {
    try {
      final result = await _sightsApi.mediaUpload(file);
      final locationKey = 'location';
      if (result.response.headers.map.containsKey(locationKey)) {
        final relativeUrl = result.response.headers.map[locationKey]!.first;
        final absUrl = '${SightsApi.baseUrl}/$relativeUrl';
        return absUrl;
      } else {
        throw (NetworkExceptions(
          msgForUser: AppStrings.msgUploadFileError,
          requestPath: '/upload_file',
          exceptionName: '',
          statusCode: result.response.statusCode ?? 0,
        ));
      }
    } catch (e) {
      rethrow;
    }
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

  bool _supportedPhotoExtension(File f) {
    final availableExtensions = ['.jpg', '.jpeg', '.png', '.gif'];
    for (var ext in availableExtensions) {
      if (f.path.toLowerCase().endsWith(ext)) return true;
    }
    return false;
  }

  bool _photoSizeMoreThenAvailable(File f) {
    final kiloBytes = (f.readAsBytesSync().lengthInBytes) / 1024;
    return kiloBytes > 800;
  }

  int _comressTrying = 0;
  Future<File?> _compressPhotoToAvailableSize(File file) async {
    String tempPath = await _getDeviceTemproraryPathFor(fileFrom: file.path);
    CompressFormat format = CompressFormat.jpeg;
    if (file.path.toLowerCase().endsWith('.png')) format = CompressFormat.png;

    /// не возможно сжать если путь входного файла такой же как и для сжатого
    if (tempPath == file.absolute.path) {
      var temp = tempPath.split('.');
      temp[temp.length - 2] = '${temp[temp.length - 2]}1';
      tempPath = temp.join('.');
      _comressTrying += 1;
    } else {
      _comressTrying = 0;
    }
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      tempPath,
      minHeight: 800,
      quality: 50,
      format: format,
    );

    if (result != null && _comressTrying < 5) {
      if (_photoSizeMoreThenAvailable(result)) {
        // сжимаем пока не будет доступный размер
        result = await _compressPhotoToAvailableSize(result);
      }
    }

    return result;
  }
}
