import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  int counter = 0;

  void increment() {
    // 상태 바꾸고
    counter++;

    notifyListeners();
  }
}