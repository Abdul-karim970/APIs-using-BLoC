part of 'album_api_bloc.dart';

@immutable
abstract class AlbumApiState {}

@immutable
class AlbumApiInitialState extends AlbumApiState {}

@immutable
class AlbumApiLoadingState extends AlbumApiState {}

@immutable
class AlbumsApiLoadedState extends AlbumApiState {
  final List<Album> albums;
  AlbumsApiLoadedState({required this.albums});
}

@immutable
class AlbumApiLoadedState extends AlbumApiState {
  final Album album;
  AlbumApiLoadedState({required this.album});
}

@immutable
class AlbumApiErrorState extends AlbumApiState {
  final String errorMessage;
  AlbumApiErrorState({
    required this.errorMessage,
  });
}
