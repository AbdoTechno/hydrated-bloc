import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';


// HydratedBloc is a special type of Bloc that automatically persists its state
// to storage and restores it on app restart. This means the counter value will
// persist across app restarts.
// it is a good choice for simple state that you want to keep between sessions
// without needing a full database or backend.
// it useful for things like user preferences, theme settings, or 
//in this case, a counter value.


class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitState()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterUpdateState(state.counterValue + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterUpdateState(state.counterValue - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    final counterValue = json['counterValue'];
    if (counterValue is int) {
      return CounterUpdateState(counterValue);
    }
    return CounterInitState();
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return {'counterValue': state.counterValue};
  }
}
