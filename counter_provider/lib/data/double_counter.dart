import 'package:counter/domain/counter.dart';

class DoubleCounter implements Counter {
  int _counter = 0;

  @override
  int get counter => _counter;

  @override
  void increment() {
    // 상태 바꾸고
    _counter += 2;
  }
}