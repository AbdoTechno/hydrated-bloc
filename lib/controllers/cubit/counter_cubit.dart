import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitState());
  void incrementCounter() {
    emit(CounterUpdateState(state.counterValue + 1));
  }
  void decrementCounter() {
    emit(CounterUpdateState(state.counterValue - 1));
  } 

}
