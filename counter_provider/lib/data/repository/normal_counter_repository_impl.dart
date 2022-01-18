import 'package:counter/data/data_source/counter.dart';
import 'package:counter/data/repository/count_repository.dart';

class NormalCountRepositoryImpl implements CountRepository {
  final Counter _counter;

  NormalCountRepositoryImpl(this._counter);

  @override
  int increment() {
    _counter.count++;
    return _counter.count;
  }
}
