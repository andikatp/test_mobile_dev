import 'package:test_mobile_dev/core/errors/exceptions.dart';

abstract class CalculateDataSource {
  const CalculateDataSource();

  Future<List<int>> getAritmeticSequenceTypeOne({required String number});
  Future<List<int>> getAritmeticSequenceTypeTwo({required String number});
  Future<List<int>> getAritmeticSequenceTypeThree({required String number});
  Future<List<dynamic>> getAritmeticSequenceTypeFour({required String number});
}

class CalculateDataSourceImpl implements CalculateDataSource {
  @override
  Future<List<int>> getAritmeticSequenceTypeOne({
    required String number,
  }) async {
    if (number.isEmpty) {
      throw const InvalidInputException(message: 'Please provide a number');
    }
    if (!isStringInteger(number)) {
      throw const InvalidInputException(message: 'Number is not an int');
    }
    final numberAsNum = num.parse(number);
    if (isLowerThanZeroOrDouble(numberAsNum)) {
      throw const InvalidInputException(
        message: 'Number must higher than zero and not be a double',
      );
    }
    final numberAsInt = int.parse(number);
    final result = List.generate(numberAsInt, (index) => index + 1);
    return result;
  }

  @override
  Future<List<int>> getAritmeticSequenceTypeTwo({
    required String number,
  }) async {
    if (number.isEmpty) {
      throw const InvalidInputException(message: 'Please provide a number');
    }
    if (!isStringInteger(number)) {
      throw const InvalidInputException(message: 'Number is not an int');
    }
    final numberAsNum = num.parse(number);
    if (isLowerThanZeroOrDouble(numberAsNum)) {
      throw const InvalidInputException(
        message: 'Number must higher than zero and not be a double',
      );
    }
    final numberAsInt = int.parse(number);
    final listOfInt = List.generate(numberAsInt, (index) => index + 1);
    final reversedList =
        List.generate(numberAsInt - 1, (index) => numberAsInt - index - 1);
    return [...listOfInt, ...reversedList];
  }

  @override
  Future<List<int>> getAritmeticSequenceTypeThree({
    required String number,
  }) async {
    if (number.isEmpty) {
      throw const InvalidInputException(message: 'Please provide a number');
    }
    if (!isStringInteger(number)) {
      throw const InvalidInputException(message: 'Number is not an int');
    }
    final numberAsNum = num.parse(number);
    if (isLowerThanZeroOrDouble(numberAsNum)) {
      throw const InvalidInputException(
        message: 'Number must higher than zero and not be a double',
      );
    }
    final numberAsInt = int.parse(number);
    return List.generate(numberAsInt, (index) => 10 + 11 * index);
  }

  @override
  Future<List<dynamic>> getAritmeticSequenceTypeFour({
    required String number,
  }) async {
    if (number.isEmpty) {
      throw const InvalidInputException(message: 'Please provide a number');
    }
    if (!isStringInteger(number)) {
      throw const InvalidInputException(message: 'Number is not an int');
    }
    final numberAsNum = num.parse(number);
    if (isLowerThanZeroOrDouble(numberAsNum)) {
      throw const InvalidInputException(
        message: 'Number must higher than zero and not be a double',
      );
    }
    final numberAsInt = int.parse(number);
    return List.generate(numberAsInt, (index) {
      index++;
      if (index % 5 == 0 && index % 7 == 0) {
        return 'LIMATUJUH';
      }
      if (index % 5 == 0) {
        return 'LIMA';
      }
      if (index % 7 == 0) {
        return 'TUJUH';
      }
      return index;
    });
  }

  bool isStringInteger(String numberToTest) {
    return int.tryParse(numberToTest) != null;
  }

  bool isLowerThanZeroOrDouble(num numberToTest) {
    return numberToTest <= 0 || numberToTest != numberToTest.roundToDouble();
  }
}
