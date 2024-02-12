import 'package:test_mobile_dev/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  ResultFuture<Type> call(Params params);
}
