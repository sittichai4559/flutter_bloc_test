import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CounterState extends Equatable {
  CounterState([List props = const []]) : super(props);
}

class UpdateCounterState extends CounterState {
  final int counter;

  UpdateCounterState(this.counter) : super([counter]);

  @override
  String toString() {
    return 'UpdateCounterState { counter: $counter}';
  }
}
