import 'package:flutter/material.dart';
import 'package:json_place_holder/domain/model/post.dart';
import 'package:json_place_holder/domain/repository/post_repository.dart';

class HomeViewModel with ChangeNotifier {
  final PostRepository _postRepository;

  // 상태
  List<Post> posts = [];
  int currentPage = 1;
  bool isLoading = false;

  HomeViewModel(this._postRepository);

  void fetch(int page) async {
    // 상태 업데이트
    isLoading = true;
    notifyListeners();

    posts = await _postRepository.getPosts(page);
    currentPage = page;
    isLoading = false;
    notifyListeners();
  }
}