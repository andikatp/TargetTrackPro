import 'package:business/core/errors/exceptions.dart';
import 'package:business/core/errors/failures.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/splash/splash_local_datasource.dart';
import 'package:business/domain/repositories/splash/splash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRepositoryImpl implements SplashRepository {
  SplashRepositoryImpl({required SplashLocalDataSource localDataSource})
      : _localDataSource = localDataSource;
  final SplashLocalDataSource _localDataSource;

  @override
  ResultFuture<bool> checkUserIsLoggedIn() async {
    try {
      final result = await _localDataSource.checkUserIsLoggedIn();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }
}
