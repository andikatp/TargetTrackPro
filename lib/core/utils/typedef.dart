import 'package:business/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<Type> = Future<Either<Failure, Type>>;
