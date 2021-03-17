import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/widgets/album_card.dart';
import '../service/albums_service.dart';
import '../viewmodel/albums_view_model.dart';

final _albumsViewModel = AlbumsViewModel(
  service: AlbumsService(
    Dio(BaseOptions(baseUrl: ServicePath.BASEURL.rawValue)),
  ),
);

class AlbumsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(_albumsViewModel.oddIndexValue);
        }),
      ),
      body: Observer(builder: (_) {
        return _albumsViewModel.isLoading ? buildCircularProgressIndicator() : buildListView();
      }),
    );
  }

  CircularProgressIndicator buildCircularProgressIndicator() => CircularProgressIndicator();

  ListView buildListView() {
    return ListView.builder(
      itemCount: _albumsViewModel.albumsList.length,
      itemBuilder: (context, index) {
        _albumsViewModel.changeIndex(index);
        return AlbumCard(model: _albumsViewModel.albumsList[index]);
      },
    );
  }
}
