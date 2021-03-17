import 'dart:io';

import 'package:dio/src/dio.dart';

import '../../../core/exception/service_path_exception.dart';
import '../model/albums_model.dart';
import 'IAlbumsService.dart';

class AlbumsService extends IAlbumsService {
  AlbumsService(Dio service) : super(service);

  @override
  Future<List<AlbumsModel>> fetchDatas() async {
    final response = await service.get(ServicePath.ALBUMS.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data;
      if (responseData is List) {
        return responseData.map((e) => AlbumsModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}

enum ServicePath { ALBUMS, BASEURL }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.ALBUMS:
        return '/albums';
      case ServicePath.BASEURL:
        return 'https://jsonplaceholder.typicode.com';

      default:
        throw ServicePathException(this);
    }
  }
}
