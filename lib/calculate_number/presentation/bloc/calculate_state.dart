part of 'calculate_bloc.dart';

sealed class CalculateState extends Equatable {
  const CalculateState();

  @override
  List<Object> get props => [];
}

final class CalculateInitial extends CalculateState {
  const CalculateInitial();
}

final class CalculateLoading extends CalculateState {
  const CalculateLoading();
}

final class CalculateLoaded extends CalculateState {
  const CalculateLoaded({required this.numbers});
  final List<dynamic> numbers;

  @override
  List<List<dynamic>> get props => [numbers];
}

final class CalculateError extends CalculateState {
  const CalculateError({required this.message});
  final String message;

  @override
  List<String> get props => [message];
}
