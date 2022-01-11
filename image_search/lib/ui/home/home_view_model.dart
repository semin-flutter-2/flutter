import 'package:flutter/material.dart';
import 'package:image_search/data/photo_api.dart';
import 'package:image_search/model/picture_result.dart';

class HomeViewModel with ChangeNotifier {
  // State
  List<Picture> pictures = [];

  final PhotoApi _api;

  HomeViewModel(this._api);

  Future<void> fetchPhoto(String query) async {
    // 상태가 변하는 타이밍
    pictures = await _api.fetchPhotos(query);
    notifyListeners();    // 변경되었다!!라고 화면에 알려줌
  }
}