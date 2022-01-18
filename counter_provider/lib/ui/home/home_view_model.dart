import 'package:counter/data/repository/count_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final CountRepository _counter;

  HomeViewModel(this._counter);

  int _count = 0;

  int get count => _count;

  void increment() {
    // 상태 바꾸고
    _count = _counter.increment();

    notifyListeners();
  }
}
