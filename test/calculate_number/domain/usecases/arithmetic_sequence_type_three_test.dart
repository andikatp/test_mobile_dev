import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_mobile_dev/calculate_number/domain/repositories/calculate_repository.dart';
import 'package:test_mobile_dev/calculate_number/domain/usecases/arithmetic_sequence_type_three.dart';
import 'package:test_mobile_dev/core/errors/failures.dart';
import 'calculate_repository_mock.dart';

void main() {
  late ArithmeticSequenceTypeThree usecase;
  late CalculateRepository mockRepository;

  setUp(() {
    mockRepository = MockCalculateRepository();
    usecase = ArithmeticSequenceTypeThree(repository: mockRepository);
  });

  final tList = [10, 21, 32, 43, 54];
  const tFailure = InvalidInputFailure(message: 'your input is not a number');

  test(
      'Should call [CalculateRepository.arithmeticSequenceTypeThree] '
      'and return [List<int>]', () async {
    // arrange
    when(
      () => mockRepository.arithmeticSequenceTypeThree(
        number: any(named: 'number'),
      ),
    ).thenAnswer((_) async => Right(tList));
    // act
    final result = await usecase('3');
    // assert
    expect(result, Right<dynamic, List<int>>(tList));
    verify(() => mockRepository.arithmeticSequenceTypeThree(number: '3'))
        .called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test(
      'Should call [CalculateRepository.arithmeticSequenceTypeThree] '
      'and return [GeneralFailure]', () async {
    // arrange
    when(
      () => mockRepository.arithmeticSequenceTypeThree(
        number: any(named: 'number'),
      ),
    ).thenAnswer((_) async => const Left(tFailure));
    // act
    final result = await usecase('3');
    // assert
    expect(result, const Left<Failure, dynamic>(tFailure));
    verify(() => mockRepository.arithmeticSequenceTypeThree(number: '3'))
        .called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
