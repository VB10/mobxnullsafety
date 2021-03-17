import 'package:flutter/material.dart';

import '../../feature/albums/model/albums_model.dart';

class AlbumCard extends StatelessWidget {
  final AlbumsModel model;

  const AlbumCard({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(model.title ?? ''),
      ),
    );
  }
}
