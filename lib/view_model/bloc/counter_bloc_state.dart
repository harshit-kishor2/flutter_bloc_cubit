part of 'counter_bloc_bloc.dart';

abstract class CounterBlocState extends Equatable {
  const CounterBlocState();

  @override
  List<Object> get props => [];
}

class CounterBlocInitial extends CounterBlocState {}

class CounterBlocLoading extends CounterBlocState {}

class CounterBlocLoaded extends CounterBlocState {
  final int value;
  const CounterBlocLoaded({
    required this.value,
  });
  @override
  List<Object> get props => [value];
}

class CounterBlocError extends CounterBlocState {
  final String error;
  const CounterBlocError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
