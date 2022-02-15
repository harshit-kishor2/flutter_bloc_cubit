import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(CounterBlocInitial()) {
    on<IncrementEvent>((event, emit) {
      try {
        emit(CounterBlocLoading());
        int getValue = event.value + 1;
        if (getValue >= 10) {
          emit(const CounterBlocError(error: "OOps...."));
        } else {
          emit(CounterBlocLoaded(value: getValue));
        }
      } catch (e) {
        emit(const CounterBlocError(error: "check your code"));
      }
    });
    on<DecrementEvent>((event, emit) {
      try {
        emit(CounterBlocLoading());
        int getValue = event.value - 1;
        if (getValue.isNegative) {
          emit(const CounterBlocError(error: "OOps...."));
        } else {
          emit(CounterBlocLoaded(value: getValue));
        }
      } catch (e) {
        emit(const CounterBlocError(error: "check your code"));
      }
    });
  }
}
