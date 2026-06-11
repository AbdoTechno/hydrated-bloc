part of 'counter_cubit.dart';

@immutable
sealed class CounterState {
  final int counterValue;
  const CounterState(this.counterValue);
}

class CounterInitState extends CounterState {
  CounterInitState() : super(0);
}

class CounterUpdateState extends CounterState {
  // CounterUpdateState(super.counterValue);
  CounterUpdateState(int counterValue) : super(counterValue);

}
