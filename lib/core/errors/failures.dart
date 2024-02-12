import 'package:equatable/equatable.dart';
import 'package:test_mobile_dev/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  String get errorMessage => 'Error: $message';

  @override
  List<Object> get props => [message];
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({required super.message});

  InvalidInputFailure.fromException(InvalidInputException exception)
      : this(message: exception.message);

  @override
  List<String> get props => [message];
}
