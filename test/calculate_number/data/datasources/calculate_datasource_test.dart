import 'package:flutter_test/flutter_test.dart';
import 'package:test_mobile_dev/calculate_number/data/datasources/calculate_datasource.dart';
import 'package:test_mobile_dev/core/errors/exceptions.dart';

void main() {
  late CalculateDataSource dataSource;

  setUp(() => dataSource = CalculateDataSourceImpl());

  group('typeOne', () {
    test('Should return arithmetic sequence of user-determined length',
        () async {
      // arrange
      const tUserInput = 7;
      final tList = List.generate(tUserInput, (index) => index + 1);
      // act
      final result = await dataSource.getAritmeticSequenceTypeOne(
        number: tUserInput.toString(),
      );
      // assert
      expect(result, equals(tList));
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is not an integer', () async {
      // arrange
      const tUserInput = 'a';
      // Act & Assert
      expect(
        () async => dataSource.getAritmeticSequenceTypeOne(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is lower than zero or double', () async {
      // arrange
      const tUserInput = '1.2';
      // Act & Assert
      expect(
        () async => dataSource.getAritmeticSequenceTypeOne(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });
  });

  group('typeTwo', () {
    test(
        'Should return arithmetic sequence from and back to 1 from '
        'user-determined length', () async {
      // arrange
      const tUserInput = 5;
      // final tList = List.generate(2 * tUserInput - 1, (index) {
      //   if (index < tUserInput) {
      //     return index + 1;
      //   } else {
      //     return 2 * tUserInput - index - 1;
      //   }
      // });
      const tListNumber = [1, 2, 3, 4, 5, 4, 3, 2, 1];
      // act
      final result = await dataSource.getAritmeticSequenceTypeTwo(
        number: tUserInput.toString(),
      );
      // assert
      expect(result, equals(tListNumber));
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is not an integer', () async {
      // arrange
      const tUserInput = 'a';
      // Act & Assert
      expect(
        () async => dataSource.getAritmeticSequenceTypeTwo(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is lower than zero or double', () async {
      // arrange
      const tUserInput = '1.2';
      // Act & Assert
      expect(
        () async => dataSource.getAritmeticSequenceTypeTwo(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });
  });

  group('typeThree', () {
    test(
        'Should return arithmetic sequence of multiple by 11 from '
        'user-determined length', () async {
      // arrange
      const tUserInput = 5;
      final tList = [10, 21, 32, 43, 54];
      // act
      final result = await dataSource.getAritmeticSequenceTypeThree(
        number: tUserInput.toString(),
      );
      // assert
      expect(result, equals(tList));
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is not an integer', () async {
      // arrange
      const tUserInput = 'a';
      // Act & Assert
      expect(
        () async =>
            dataSource.getAritmeticSequenceTypeThree(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is lower than zero or double', () async {
      // arrange
      const tUserInput = '1.2';
      // Act & Assert
      expect(
        () async =>
            dataSource.getAritmeticSequenceTypeThree(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });
  });

  group('typeFour', () {
    test(
        'Should return arithmetic sequence with multiples of 5 replaced with '
        'LIMA and multiples of 7 with TUJUH, from '
        'user-determined length', () async {
      // arrange
      const tUserInput = 9;
      final tList = [1, 2, 3, 4, 'LIMA', 6, 'TUJUH', 8, 9];
      // act
      final result = await dataSource.getAritmeticSequenceTypeFour(
        number: tUserInput.toString(),
      );
      // assert
      expect(result, equals(tList));
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is not an integer', () async {
      // arrange
      const tUserInput = 'a';
      // Act & Assert
      expect(
        () async =>
            dataSource.getAritmeticSequenceTypeFour(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });

    test(
        'Should return a [InvalidInputException] when the input '
        'is lower than zero or double', () async {
      // arrange
      const tUserInput = '1.2';
      // Act & Assert
      expect(
        () async =>
            dataSource.getAritmeticSequenceTypeFour(number: tUserInput),
        throwsA(isA<InvalidInputException>()),
      );
    });
  });
}
