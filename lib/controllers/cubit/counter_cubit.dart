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


// if state is int we can directly emit int value  without creating state class 
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//   void incrementCounter() {
//     emit(state + 1);
//   }
//   void decrementCounter() {
//     emit(state - 1);
//   }
// }  
// but it is not a good practice to emit primitive data type as state
// because it will be difficult to manage the state in future f
//when we have multiple states and also it will be difficult to debug the state changes.
// so it is better to create state class and emit the state class object.

// in ui we can directly use the state value without creating state class
// but it is not a good practice to use primitive data type as state
// because it will be difficult to manage the state in future
// code example
// int is the state of the cubit and we can directly use it in the ui without creating state class
// BlocBuilder<CounterCubit, int>( 
//   builder: (context, state) => Text(
//     '$state',
//     style: Theme.of(context).textTheme.headlineMedium,
//   ),
// ),
