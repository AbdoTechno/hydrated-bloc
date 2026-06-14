import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';

// HydratedCubit keeps the counter value across app restarts.
// We use a dedicated state class here so the cubit can grow later
// without changing the public state type from one screen to another.
class CounterCubit extends HydratedCubit<CounterState> {
  // Start from the default state.
  // If hydrated_bloc finds a saved value, it replaces this on startup.
  CounterCubit() : super(CounterInitState());

  // Emit a new state instead of mutating the old one.
  // This is the standard Cubit pattern and it keeps rebuilds predictable.
  void incrementCounter() {
    emit(CounterUpdateState(state.counterValue + 1));
  }

  // Same idea for decrementing: create a fresh state and emit it.
  void decrementCounter() {
    emit(CounterUpdateState(state.counterValue - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // This runs when the cubit is created and tries to restore the last value
    // from storage after an app restart.
    final counterValue = json['counterValue'];
    if (counterValue is int) {
      return CounterUpdateState(counterValue);
    }
    return CounterInitState();
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    // This runs after each successful emit so hydrated_bloc can persist it.
    return {'counterValue': state.counterValue};
  }
}


// If the state is just an int, you can use Cubit<int> directly.
// That is fine for very small examples, but a state class is usually better
// when the screen may grow or need more than one state shape later.
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//   void incrementCounter() {
//     emit(state + 1);
//   }
//   void decrementCounter() {
//     emit(state - 1);
//   }
// }  
// But it is usually not the best practice to emit a primitive type as state.
// Once the feature grows, it becomes harder to add loading, error, or extra data
// without changing the whole state type.
// So using a state class is better for maintainability and debugging.

// In the UI, a primitive state is simpler to read because you can use it directly.
// That is why it is often used in quick demos or throwaway examples.
// code example
// int is the state of the cubit and we can directly use it in the UI without a separate state class.
// BlocBuilder<CounterCubit, int>( 
//   builder: (context, state) => Text(
//     '$state',
//     style: Theme.of(context).textTheme.headlineMedium,
//   ),
// ),
