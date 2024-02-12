import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_mobile_dev/calculate_number/data/datasources/calculate_datasource.dart';
import 'package:test_mobile_dev/calculate_number/data/repositories/calculate_repository_impl.dart';
import 'package:test_mobile_dev/calculate_number/domain/repositories/calculate_repository.dart';
import 'package:test_mobile_dev/core/errors/exceptions.dart';
import 'package:test_mobile_dev/core/errors/failures.dart';

class MockCalculateDataSource extends Mock implements CalculateDataSource {}

void main() {
  late CalculateRepository repository;
  late CalculateDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockCalculateDataSource();
    repository = CalculateRepositoryImpl(dataSource: mockDataSource);
  });

  group('typeOne', () {
    final tList = [1, 2, 3, 4, 5];
    const tException =
        InvalidInputException(message: 'Your input is not an int');
    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeOne] '
        'and return a Right data', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeOne(
          number: any(named: 'number'),
        ),
      ).thenAnswer((_) async => tList);
      // act
      final result = await repository.arithmeticSequenceTypeOne(number: '5');
      // assert
      expect(result, Right<dynamic, List<int>>(tList));
      verify(() => mockDataSource.getAritmeticSequenceTypeOne(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeOne] '
        'and return a [GeneralFailure] when failed', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeOne(
          number: any(named: 'number'),
        ),
      ).thenThrow(tException);
      // act
      final result = await repository.arithmeticSequenceTypeOne(number: '5');
      // assert
      expect(
        result,
        Left<Failure, dynamic>(InvalidInputFailure.fromException(tException)),
      );
      verify(() => mockDataSource.getAritmeticSequenceTypeOne(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('typeTwo', () {
    final tList = [1, 2, 3, 4, 5, 4, 3, 2, 1];
    const tException =
        InvalidInputException(message: 'Your input is not an int');
    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeTwo] '
        'and return a Right data', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeTwo(
          number: any(named: 'number'),
        ),
      ).thenAnswer((_) async => tList);
      // act
      final result = await repository.arithmeticSequenceTypeTwo(number: '5');
      // assert
      expect(result, Right<dynamic, List<int>>(tList));
      verify(() => mockDataSource.getAritmeticSequenceTypeTwo(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeTwo] '
        'and return a [GeneralFailure] when failed', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeTwo(
          number: any(named: 'number'),
        ),
      ).thenThrow(tException);
      // act
      final result = await repository.arithmeticSequenceTypeTwo(number: '5');
      // assert
      expect(
        result,
        Left<Failure, dynamic>(InvalidInputFailure.fromException(tException)),
      );
      verify(() => mockDataSource.getAritmeticSequenceTypeTwo(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('typeThree', () {
    final tList = [10, 21, 32, 43, 5, 4];
    const tException =
        InvalidInputException(message: 'Your input is not an int');
    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeThree] '
        'and return a Right data', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeThree(
          number: any(named: 'number'),
        ),
      ).thenAnswer((_) async => tList);
      // act
      final result = await repository.arithmeticSequenceTypeThree(number: '5');
      // assert
      expect(result, Right<dynamic, List<int>>(tList));
      verify(() => mockDataSource.getAritmeticSequenceTypeThree(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeThree] '
        'and return a [GeneralFailure] when failed', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeThree(
          number: any(named: 'number'),
        ),
      ).thenThrow(tException);
      // act
      final result = await repository.arithmeticSequenceTypeThree(number: '5');
      // assert
      expect(
        result,
        Left<Failure, dynamic>(InvalidInputFailure.fromException(tException)),
      );
      verify(() => mockDataSource.getAritmeticSequenceTypeThree(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('typeFour', () {
    final tList = [1, 2, 3, 4, 'LIMA', 6, 'TUJUH', 8];
    const tException =
        InvalidInputException(message: 'Your input is not an int');
    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeFour] '
        'and return a Right data', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeFour(
          number: any(named: 'number'),
        ),
      ).thenAnswer((_) async => tList);
      // act
      final result = await repository.arithmeticSequenceTypeFour(number: '5');
      // assert
      expect(result, Right<dynamic, List<dynamic>>(tList));
      verify(() => mockDataSource.getAritmeticSequenceTypeFour(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'Should call [mockDataSource.getAritmeticSequenceTypeFour] '
        'and return a [GeneralFailure] when failed', () async {
      // arrange
      when(
        () => mockDataSource.getAritmeticSequenceTypeFour(
          number: any(named: 'number'),
        ),
      ).thenThrow(tException);
      // act
      final result = await repository.arithmeticSequenceTypeFour(number: '5');
      // assert
      expect(
        result,
        Left<Failure, dynamic>(InvalidInputFailure.fromException(tException)),
      );
      verify(() => mockDataSource.getAritmeticSequenceTypeFour(number: '5'))
          .called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
