import 'package:dartz/dartz.dart';
import 'package:test_mobile_dev/calculate_number/data/datasources/calculate_datasource.dart';
import 'package:test_mobile_dev/calculate_number/domain/repositories/calculate_repository.dart';
import 'package:test_mobile_dev/core/errors/exceptions.dart';
import 'package:test_mobile_dev/core/errors/failures.dart';
import 'package:test_mobile_dev/core/utils/typedef.dart';

class CalculateRepositoryImpl implements CalculateRepository {
  CalculateRepositoryImpl({required CalculateDataSource dataSource})
      : _dataSource = dataSource;

  final CalculateDataSource _dataSource;

  @override
  ResultFuture<List<int>> arithmeticSequenceTypeOne({
    required String number,
  }) async {
    try {
      final result =
          await _dataSource.getAritmeticSequenceTypeOne(number: number);
      return Right(result);
    } on InvalidInputException catch (e) {
      return Left(InvalidInputFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<int>> arithmeticSequenceTypeTwo({
    required String number,
  }) async {
    try {
      final result =
          await _dataSource.getAritmeticSequenceTypeTwo(number: number);
      return Right(result);
    } on InvalidInputException catch (e) {
      return Left(InvalidInputFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<int>> arithmeticSequenceTypeThree({
    required String number,
  }) async {
    try {
      final result =
          await _dataSource.getAritmeticSequenceTypeThree(number: number);
      return Right(result);
    } on InvalidInputException catch (e) {
      return Left(InvalidInputFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<dynamic>> arithmeticSequenceTypeFour({
    required String number,
  }) async {
    try {
      final result =
          await _dataSource.getAritmeticSequenceTypeFour(number: number);
      return Right(result);
    } on InvalidInputException catch (e) {
      return Left(InvalidInputFailure.fromException(e));
    }
  }
}
