import 'package:business/core/errors/exceptions.dart';
import 'package:business/core/errors/failures.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/auth/auth_local_data_source.dart';
import 'package:business/domain/entities/core/user.dart';
import 'package:business/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthLocalDataSource dataSource})
      : _dataSource = dataSource;
  final AuthLocalDataSource _dataSource;

  @override
  ResultFuture<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _dataSource.login(email: email, password: password);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> register({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    try {
      final result = await _dataSource.register(
        email: email,
        password: password,
        role: role,
      );
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }
}
