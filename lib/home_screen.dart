import 'package:bloc_demo/Modals/userModal.dart';
import 'package:bloc_demo/homescreen_bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeScreenBloc>().add(GetUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<HomeScreenBloc, HomeScreenState>(builder: (BuildContext context, HomeScreenState state) {
          if (state is HomeScreenError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            SnackBar snackBar = SnackBar(
              content: Text('${message}'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is HomeScreenLoadedState) {
            List<User> albums = state.albums;
            return _list(albums);
          }
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
      ],
    );
  }

  Widget _list(List<User> albums) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (_, index) {
            User album = albums[index];
            return Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('${album.title}'),
            );
          },
        ),
      ),
    );
  }
}
