import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_four.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_one.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_three.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_two.dart';
import 'package:test_mobile_dev/calculate_number/presentation/bloc/calculate_bloc.dart';
import 'package:test_mobile_dev/core/errors/failures.dart';

class MockTypeOne extends Mock implements ArithmeticSequenceTypeOne {}

class MockTypeTwo extends Mock implements ArithmeticSequenceTypeTwo {}

class MockTypeThree extends Mock implements ArithmeticSequenceTypeThree {}

class MockTypeFour extends Mock implements ArithmeticSequenceTypeFour {}

void main() {
  late CalculateBloc calculateBloc;
  late ArithmeticSequenceTypeOne mockTypeOne;
  late ArithmeticSequenceTypeTwo mockTypeTwo;
  late ArithmeticSequenceTypeThree mockTypeThree;
  late ArithmeticSequenceTypeFour mockTypeFour;

  setUp(() {
    mockTypeOne = MockTypeOne();
    mockTypeTwo = MockTypeTwo();
    mockTypeThree = MockTypeThree();
    mockTypeFour = MockTypeFour();
    calculateBloc = CalculateBloc(
      typeOne: mockTypeOne,
      typeTwo: mockTypeTwo,
      typeThree: mockTypeThree,
      typeFour: mockTypeFour,
    );
  });

  test('Should get [DetailInitial] as initial state', () async {
    // assert
    expect(calculateBloc.state, const CalculateInitial());
  });

  group('typeOne', () {
    const tList = [1, 2, 3];
    const tNumber = 3;
    const tFailure = InvalidInputFailure(message: 'message');
    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is gotten successfully',
      build: () {
        when(() => mockTypeOne(any()))
            .thenAnswer((_) async => const Right(tList));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeOne(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        const CalculateLoaded(numbers: tList),
      ],
    );

    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is unsuccessfully',
      build: () {
        when(
          () => mockTypeOne(any()),
        ).thenAnswer((_) async => const Left(tFailure));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeOne(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        CalculateError(message: tFailure.errorMessage),
      ],
    );
  });

   group('typeTwo', () {
    const tList = [1, 2, 3, 2, 1];
    const tNumber = 3;
    const tFailure = InvalidInputFailure(message: 'message');
    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is gotten successfully',
      build: () {
        when(() => mockTypeTwo(any()))
            .thenAnswer((_) async => const Right(tList));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeTwo(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        const CalculateLoaded(numbers: tList),
      ],
    );

    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is unsuccessfully',
      build: () {
        when(
          () => mockTypeTwo(any()),
        ).thenAnswer((_) async => const Left(tFailure));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeTwo(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        CalculateError(message: tFailure.errorMessage),
      ],
    );
  });

   group('typeThree', () {
    const tList = [10, 21, 32, 43, 54];
    const tNumber = 5;
    const tFailure = InvalidInputFailure(message: 'message');
    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is gotten successfully',
      build: () {
        when(() => mockTypeThree(any()))
            .thenAnswer((_) async => const Right(tList));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeThree(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        const CalculateLoaded(numbers: tList),
      ],
    );

    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is unsuccessfully',
      build: () {
        when(
          () => mockTypeThree(any()),
        ).thenAnswer((_) async => const Left(tFailure));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeThree(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        CalculateError(message: tFailure.errorMessage),
      ],
    );
  });

   group('typeFour', () {
    const tList = [1, 2, 3, 4, 'LIMA', 6, 'TUJUH'];
    const tNumber = 3;
    const tFailure = InvalidInputFailure(message: 'message');
    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is gotten successfully',
      build: () {
        when(() => mockTypeFour(any()))
            .thenAnswer((_) async => const Right(tList));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeFour(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        const CalculateLoaded(numbers: tList),
      ],
    );

    blocTest<CalculateBloc, CalculateState>(
      'Should emit [CalculateLoading] and [CalculateLoaded] '
      'when data is unsuccessfully',
      build: () {
        when(
          () => mockTypeFour(any()),
        ).thenAnswer((_) async => const Left(tFailure));
        return calculateBloc;
      },
      act: (bloc) => bloc.add(CalculateTypeFour(number: tNumber.toString())),
      expect: () => [
        const CalculateLoading(),
        CalculateError(message: tFailure.errorMessage),
      ],
    );
  });
}
