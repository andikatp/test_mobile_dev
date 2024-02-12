import 'package:test_mobile_dev/calculate_number/domain/repositories/calculate_repository.dart';
import 'package:test_mobile_dev/core/usecases/usecases.dart';
import 'package:test_mobile_dev/core/utils/typedef.dart';

class ArithmeticSequenceTypeThree implements UseCase<List<int>, String> {
  ArithmeticSequenceTypeThree({required CalculateRepository repository})
      : _repository = repository;
  final CalculateRepository _repository;

  @override
  ResultFuture<List<int>> call(String number) =>
      _repository.arithmeticSequenceTypeThree(number: number);
}
