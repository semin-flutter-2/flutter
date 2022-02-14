import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:json_place_holder/domain/model/post.dart';
import 'package:json_place_holder/domain/use_case/get_post_with_even_id_use_case.dart';

class UiState {
  final List<Post> _posts = [];
  final int _currentPage = 1;
  final bool _isLoading = false;
  final bool _isLoading = false;

  UiState copy({List<Post> _posts, int _currentPage, bool isLoading}) {

  }
}

class HomeViewModel with ChangeNotifier {
  final GetPostWithEvenIdUseCase _getPostWithEvenIdUseCase;

  // 상태
  UiState state = UiState();
  // List<Post> _posts = [];
  // int _currentPage = 1;
  // bool _isLoading = false;

  List<Post> get posts => UnmodifiableListView(_posts);

  int get currentPage => _currentPage;

  bool get isLoading => _isLoading;

  HomeViewModel(this._getPostWithEvenIdUseCase);

  void fetch(int page) async {
    // 상태 업데이트
    _isLoading = true;
    notifyListeners();

    _posts = await _getPostWithEvenIdUseCase(page);
    _currentPage = page;
    _isLoading = false;
    notifyListeners();
  }
}
