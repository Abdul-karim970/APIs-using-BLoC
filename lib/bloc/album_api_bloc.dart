import 'package:bloc/bloc.dart';
import 'package:bloc_in_api/album_api_provider/api_provider.dart';
import 'package:meta/meta.dart';

import '../album_api_provider/album.dart';

part 'album_api_event.dart';
part 'album_api_state.dart';

class AlbumApiBloc extends Bloc<AlbumApiEvents, AlbumApiState> {
  static const errorMessage = 'Mrzi hy ustad teri...';
  AlbumApiProvider albumApiProvider = AlbumApiProvider();
  AlbumApiBloc() : super(AlbumApiInitialState()) {
    on<FetchAlbumsAPIEvent>((event, emit) async {
      emit(AlbumApiLoadingState());
      try {
        var albums = await albumApiProvider.fetchAlbums();
        emit(AlbumsApiLoadedState(albums: albums));
      } catch (e) {
        emit(AlbumApiErrorState(errorMessage: errorMessage));
      }
    });
    on<FetchAlbumAPIEvent>((event, emit) async {
      emit(AlbumApiLoadingState());
      try {
        var album = await albumApiProvider.fetchAlbum('/2');
        emit(AlbumApiLoadedState(album: album));
      } catch (e) {
        emit(AlbumApiErrorState(errorMessage: errorMessage));
      }
    });
  }
}
