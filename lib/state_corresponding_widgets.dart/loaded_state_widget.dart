import 'package:bloc_in_api/album_api_provider/album.dart';
import 'package:flutter/material.dart';

class LoadedStateWidget extends StatelessWidget {
  const LoadedStateWidget({super.key, required this.albums});
  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: albums.length,
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AlbumListTile(
        album: albums[index],
      ),
    );
  }
}

class AlbumListTile extends ListTile {
  AlbumListTile({required Album album, super.key})
      : super(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text(
                album.id.toString(),
                style: TextStyle(color: Colors.blueGrey.shade100),
              ),
            ),
            tileColor: Colors.blueGrey.shade100,
            title: Text(album.title),
            trailing: Text(album.userId.toString()));
}
