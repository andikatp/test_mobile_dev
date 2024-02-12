import 'package:equatable/equatable.dart';

class InvalidInputException extends Equatable implements Exception {
  const InvalidInputException({required this.message});
  final String message;

  @override
  List<String?> get props => [message];
}
