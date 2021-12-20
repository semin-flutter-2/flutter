import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/model/album.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  // 오래 걸리는 처리
  Future<Album> fetchAlbum() async {
    // await [Future가 리턴되는 코드]
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Sample'),
      ),
      body: FutureBuilder<Album>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('네트워크 에러!!!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 데이터가 없다면
          if (!snapshot.hasData) {
            return const Center(child: Text('데이터가 없습니다'));
          }

          // 데이터가 여기에서는 무조건 있는 상황
          final Album album = snapshot.data!;

          return _buildBody(album);
        },
      ),
    );
  }

  Widget _buildBody(Album album) {
    return Text(
      '${album.id} : ${album.toString()}',
      style: const TextStyle(fontSize: 30),
    );
  }
}
