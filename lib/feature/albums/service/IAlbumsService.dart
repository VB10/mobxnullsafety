import 'package:dio/dio.dart';

import '../model/albums_model.dart';

abstract class IAlbumsService {
  IAlbumsService(this.service);

  Future<List<AlbumsModel>> fetchDatas();

  final Dio service;
}
