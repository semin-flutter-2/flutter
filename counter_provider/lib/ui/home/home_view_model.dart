import 'package:counter/domain/counter.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final Counter _counter;

  HomeViewModel(this._counter);

  int get counter => _counter.counter;

  void increment() {
    // 상태 바꾸고
    _counter.increment();

    notifyListeners();
  }
}
