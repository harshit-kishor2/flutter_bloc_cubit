part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterLoaded extends CounterState {
  final int value;
  CounterLoaded({
    required this.value,
  });
  @override
  List<Object> get props => [value];
}

class CounterError extends CounterState {
  final String error;
  CounterError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
