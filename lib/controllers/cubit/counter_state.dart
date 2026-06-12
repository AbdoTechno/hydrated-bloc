part of 'counter_cubit.dart';

@immutable
// Equatable helps Dart compare objects by their values
// instead of comparing memory references.
//
// Without Equatable:
// CounterUpdateState(5) != CounterUpdateState(5)
//
// Because they are two different objects in memory.
//
// With Equatable:
// CounterUpdateState(5) == CounterUpdateState(5)
//
// Because Equatable compares the values inside props.
//
// This is useful in Bloc/Cubit because it prevents
// unnecessary state updates and rebuilds when the state
// data has not actually changed.

sealed class CounterState extends Equatable {
  final int counterValue;

  const CounterState(this.counterValue);

  @override
  List<Object?> get props => [counterValue];
}

class CounterInitState extends CounterState {
  CounterInitState() : super(0);
}

class CounterUpdateState extends CounterState {
  // CounterUpdateState(super.counterValue);
  CounterUpdateState(int counterValue) : super(counterValue);
}




/*
═══════════════════════════════════════════════
                Equatable Notes
═══════════════════════════════════════════════

What is Equatable?

Equatable is a package that makes object comparison
based on values instead of memory addresses.

Why do we need it?

By default, Dart compares objects by reference.

Example:

CounterUpdateState(5);
CounterUpdateState(5);

Even though both objects contain the same value (5),
Dart considers them different because they are stored
in different memory locations.

Without Equatable:

state1 == state2  --> false

With Equatable:

state1 == state2  --> true

How does it work?

Equatable checks all properties inside props.

Example:

@override
List<Object?> get props => [counterValue];

Now Equatable compares counterValue when checking
if two states are equal.

Why is it important in Bloc/Cubit?

Bloc emits new states frequently.

Equatable helps Bloc know whether the new state
is actually different from the current state.

This improves performance and avoids unnecessary
rebuilds.

Rule:

Every property that identifies the state should be
added to props.

Example:

List<Object?> get props => [
  counterValue,
  userName,
  isLoading,
];

═══════════════════════════════════════════════
*/