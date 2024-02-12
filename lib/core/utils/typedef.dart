import 'package:dartz/dartz.dart';
import 'package:test_mobile_dev/core/errors/failures.dart';

typedef ResultFuture<Type> = Future<Either<Failure, Type>>;
