part of 'counter_bloc_bloc.dart';

abstract class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterBlocEvent {
  final int value;
  const IncrementEvent({
    required this.value,
  });
  @override
  List<Object> get props => [value];
}

class DecrementEvent extends CounterBlocEvent {
  final int value;
  const DecrementEvent({
    required this.value,
  });
  @override
  List<Object> get props => [value];
}
