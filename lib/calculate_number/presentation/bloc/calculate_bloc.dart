import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_four.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_one.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_three.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_two.dart';

part 'calculate_event.dart';
part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc({
    required ArithmeticSequenceTypeOne typeOne,
    required ArithmeticSequenceTypeTwo typeTwo,
    required ArithmeticSequenceTypeThree typeThree,
    required ArithmeticSequenceTypeFour typeFour,
  })  : _typeOne = typeOne,
        _typeTwo = typeTwo,
        _typeThree = typeThree,
        _typeFour = typeFour,
        super(const CalculateInitial()) {
    on<CalculateEvent>((event, emit) => emit(const CalculateLoading()));
    on<CalculateTypeOne>(getTypeOneHandler);
    on<CalculateTypeTwo>(getTypeTwoHandler);
    on<CalculateTypeThree>(getTypeThreeHandler);
    on<CalculateTypeFour>(getTypeFourHandler);
  }

  final ArithmeticSequenceTypeOne _typeOne;
  final ArithmeticSequenceTypeTwo _typeTwo;
  final ArithmeticSequenceTypeThree _typeThree;
  final ArithmeticSequenceTypeFour _typeFour;

  Future<void> getTypeOneHandler(
    CalculateTypeOne event,
    Emitter<CalculateState> emit,
  ) async {
    final result = await _typeOne(event.number);
    result.fold(
      (failure) => emit(CalculateError(message: failure.errorMessage)),
      (numbers) => emit(CalculateLoaded(numbers: numbers)),
    );
  }

  Future<void> getTypeTwoHandler(
    CalculateTypeTwo event,
    Emitter<CalculateState> emit,
  ) async {
    final result = await _typeTwo(event.number);
    result.fold(
      (failure) => emit(CalculateError(message: failure.errorMessage)),
      (numbers) => emit(CalculateLoaded(numbers: numbers)),
    );
  }

  Future<void> getTypeThreeHandler(
    CalculateTypeThree event,
    Emitter<CalculateState> emit,
  ) async {
    final result = await _typeThree(event.number);
    result.fold(
      (failure) => emit(CalculateError(message: failure.errorMessage)),
      (numbers) => emit(CalculateLoaded(numbers: numbers)),
    );
  }

  Future<void> getTypeFourHandler(
    CalculateTypeFour event,
    Emitter<CalculateState> emit,
  ) async {
    final result = await _typeFour(event.number);
    result.fold(
      (failure) => emit(CalculateError(message: failure.errorMessage)),
      (numbers) => emit(CalculateLoaded(numbers: numbers)),
    );
  }
}
