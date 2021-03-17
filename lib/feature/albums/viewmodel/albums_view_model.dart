import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/albums_model.dart';
import '../service/IAlbumsService.dart';

part 'albums_view_model.g.dart';

class AlbumsViewModel = _AlbumsViewModelBase with _$AlbumsViewModel;

abstract class _AlbumsViewModelBase with Store {
  @observable
  bool isLoading = true;
  @observable
  int currentIndex = 0;

  @computed
  String get oddIndexValue => currentIndex.isOdd ? 'ODD' : 'EVEN';

  @observable
  List<AlbumsModel> albumsList = [];

  IAlbumsService service;
  _AlbumsViewModelBase({
    required this.service,
  }) {
    fetchDatas();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchDatas() async {
    albumsList = await service.fetchDatas();
    changeLoading();
  }

  @action
  void changeIndex(int index) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      currentIndex = index;
    });
  }
}
