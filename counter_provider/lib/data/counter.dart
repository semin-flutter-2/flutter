class Counter {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    // 상태 바꾸고
    _counter++;
  }
}