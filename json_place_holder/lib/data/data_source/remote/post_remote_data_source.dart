import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_place_holder/domain/model/post.dart';

class PostRemoteDataSource {
  final http.Client _client;

  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  PostRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  Future<List<Post>> getPosts() async {
    final response = await _client.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
