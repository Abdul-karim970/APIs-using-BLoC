import 'package:bloc_in_api/bloc/album_api_bloc.dart';
import 'package:bloc_in_api/state_corresponding_widgets.dart/album_loaded_state_widget.dart';
import 'package:bloc_in_api/state_corresponding_widgets.dart/error_state_widget.dart';
import 'package:bloc_in_api/state_corresponding_widgets.dart/initial_state_widget.dart';
import 'package:bloc_in_api/state_corresponding_widgets.dart/loaded_state_widget.dart';
import 'package:bloc_in_api/state_corresponding_widgets.dart/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AlbumApiBloc>(
        create: (context) => AlbumApiBloc(),
        child: const MyHomePage(title: 'APIs in BLoC'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _fetchAlbums() {
    AlbumApiBloc albumApiBloc = context.read<AlbumApiBloc>();
    albumApiBloc.add(FetchAlbumsAPIEvent());
  }

  void _fetchAlbum() {
    AlbumApiBloc albumApiBloc = context.read<AlbumApiBloc>();
    albumApiBloc.add(FetchAlbumAPIEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.blueGrey.shade100),
        ),
      ),
      body: Center(child: BlocBuilder<AlbumApiBloc, AlbumApiState>(
        builder: (context, state) {
          if (state is AlbumApiInitialState) {
            return const InitialStateWidget();
          } else if (state is AlbumApiLoadingState) {
            return const LoadingStateWidget();
          } else if (state is AlbumsApiLoadedState) {
            return LoadedStateWidget(albums: state.albums);
          } else if (state is AlbumApiLoadedState) {
            return AlbumLoadedWidget(album: state.album);
          } else {
            return ErrorStateWidget(
                errorMessage: (state as AlbumApiErrorState).errorMessage);
          }
        },
      )),
      floatingActionButton: ButtonBar(children: [
        FloatingActionButton(
          onPressed: _fetchAlbums,
          backgroundColor: Colors.blueGrey,
          tooltip: 'Fetch Albums',
          child: Icon(
            Icons.api,
            color: Colors.blueGrey.shade100,
          ),
        ),
        FloatingActionButton(
          onPressed: _fetchAlbum,
          backgroundColor: Colors.blueGrey,
          tooltip: 'Fetch Album',
          child: Icon(
            Icons.event_note_sharp,
            color: Colors.blueGrey.shade100,
          ),
        ),
      ]),
    );
  }
}
