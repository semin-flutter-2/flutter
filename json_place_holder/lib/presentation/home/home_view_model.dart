import 'package:flutter/material.dart';
import 'package:json_place_holder/domain/model/post.dart';
import 'package:json_place_holder/domain/use_case/get_post_with_even_id_use_case.dart';

class HomeViewModel with ChangeNotifier {
  final GetPostWithEvenIdUseCase _getPostWithEvenIdUseCase;

  // 상태
  List<Post> posts = [];
  int currentPage = 1;
  bool isLoading = false;

  HomeViewModel(this._getPostWithEvenIdUseCase);

  void fetch(int page) async {
    // 상태 업데이트
    isLoading = true;
    notifyListeners();

    posts = await _getPostWithEvenIdUseCase(page);
    currentPage = page;
    isLoading = false;
    notifyListeners();
  }
}