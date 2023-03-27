import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Modals/userModal.dart';

abstract class AlbumsRepo {
  Future<List<User>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  //
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_ALBUMS = '/albums';
  @override
  Future<List<User>> getAlbumList() async {
    Uri uri = Uri.https(_baseUrl, _GET_ALBUMS);
    Response response = await http.get(uri);
    //  List<User> albums = User.fromJson(response.body);

    List<User> userListData = List<User>.from(json.decode(response.body).map((x) => User.fromJson(x)));
    print('user list data is ${userListData.length}');
    userListData.forEach((element) {
      print('elemet is ${element.title}');
    });
    return userListData;
  }
}
