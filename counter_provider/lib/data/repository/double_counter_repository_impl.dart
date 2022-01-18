import 'package:counter/data/data_source/counter.dart';
import 'package:counter/data/repository/count_repository.dart';

class DoubleCountRepository implements CountRepository {
  final Counter _counter;

  DoubleCountRepository(this._counter);

  @override
  int increment() {
    _counter.count += 2;
    return _counter.count;
  }
}
