import 'package:business/core/errors/failures.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/main/main_local_data_source.dart';
import 'package:business/domain/repositories/main/main_repository.dart';
import 'package:dartz/dartz.dart';

class MainRepositoryImpl implements MainRepository {
  MainRepositoryImpl({required MainLocalDataSource dataSource})
      : _dataSource = dataSource;
  final MainLocalDataSource _dataSource;

  @override
  ResultFuture<void> logOut() async {
    try {
      final result = await _dataSource.logOut();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
