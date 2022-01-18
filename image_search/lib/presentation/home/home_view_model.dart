import 'package:flutter/material.dart';
import 'package:image_search/domain/repository/picture_repository.dart';
import 'package:image_search/domain/model/picture.dart';

class HomeViewModel with ChangeNotifier {
  // State
  List<Picture> pictures = [];

  final PictureRepository _api;

  HomeViewModel(this._api);

  Future<void> fetchPhoto(String query) async {
    // 상태가 변하는 타이밍
    pictures = await _api.fetch(query);
    notifyListeners(); // 변경되었다!!라고 화면에 알려줌
  }
}
