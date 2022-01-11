import 'package:counter/domain/counter.dart';

class DoubleCounter implements Counter {
  int _counter = 0;

  @override
  int increment() {
    _counter += 2;
    return _counter;
  }
}
