part of 'counter_bloc.dart';

sealed class CounterState {
  final int counterValue;
  const CounterState(this.counterValue);
}

class CounterInitState extends CounterState {
  CounterInitState() : super(0);
}

class CounterUpdateState extends CounterState {
  // CounterUpdateState(super.counterValue);
  CounterUpdateState(super.counterValue);

}
