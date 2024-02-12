import 'package:test_mobile_dev/calculate_number/domain/repositories/calculate_repository.dart';
import 'package:test_mobile_dev/core/usecases/usecases.dart';
import 'package:test_mobile_dev/core/utils/typedef.dart';

class ArithmeticSequenceTypeFour implements UseCase<List<dynamic>, String> {
  ArithmeticSequenceTypeFour({required CalculateRepository repository})
      : _repository = repository;
  final CalculateRepository _repository;

  @override
  ResultFuture<List<dynamic>> call(String number) =>
      _repository.arithmeticSequenceTypeFour(number: number);
}
