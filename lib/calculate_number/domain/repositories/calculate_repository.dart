import 'package:test_mobile_dev/core/utils/typedef.dart';

abstract class CalculateRepository {
  const CalculateRepository();

  ResultFuture<List<int>> arithmeticSequenceTypeOne({required String number});
  ResultFuture<List<int>> arithmeticSequenceTypeTwo({required String number});
  ResultFuture<List<int>> arithmeticSequenceTypeThree({required String number});
  ResultFuture<List<dynamic>> arithmeticSequenceTypeFour({
    required String number,
  });
}
