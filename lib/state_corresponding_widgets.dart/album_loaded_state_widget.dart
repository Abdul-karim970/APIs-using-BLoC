import 'package:flutter/material.dart';

import '../album_api_provider/album.dart';

class AlbumLoadedWidget extends StatelessWidget {
  const AlbumLoadedWidget({super.key, required this.album});
  final Album album;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(
              album.id.toString(),
              style: TextStyle(color: Colors.blueGrey.shade100),
            ),
          ),
          tileColor: Colors.blueGrey.shade100,
          title: Text(album.title),
          trailing: Text(album.userId.toString()),
        ),
      ),
    );
  }
}
