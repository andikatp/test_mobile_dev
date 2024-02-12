part of 'calculate_bloc.dart';

sealed class CalculateEvent extends Equatable {
  const CalculateEvent();

  @override
  List<Object> get props => [];
}

class CalculateTypeOne extends CalculateEvent {
  const CalculateTypeOne({required this.number});
  final String number;

  @override
  List<String> get props => [number];
}

class CalculateTypeTwo extends CalculateEvent {
  const CalculateTypeTwo({required this.number});
  final String number;

  @override
  List<String> get props => [number];
}

class CalculateTypeThree extends CalculateEvent {
  const CalculateTypeThree({required this.number});
  final String number;

  @override
  List<String> get props => [number];
}

class CalculateTypeFour extends CalculateEvent {
  const CalculateTypeFour({required this.number});
  final String number;

  @override
  List<String> get props => [number];
}
