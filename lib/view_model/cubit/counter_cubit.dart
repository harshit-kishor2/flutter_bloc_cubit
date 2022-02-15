import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  Future<void> incrementValue(int state) async {
    try {
      emit(CounterLoading());
      state = state + 1;
      emit(CounterLoaded(value: state));
    } on Exception {
      emit(CounterError(error: "Please check the code"));
    }
  }

  Future<void> decrementValue(int state) async {
    try {
      emit(CounterLoading());
      state = state - 1;
      if (state.isNegative) {
        emit(CounterError(error: "OOps.... you have cross limit"));
      } else {
        emit(CounterLoaded(value: state));
      }
    } on Exception {
      emit(CounterError(error: "Please check the code"));
    }
  }
}
