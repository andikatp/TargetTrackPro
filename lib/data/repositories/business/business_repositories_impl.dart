import 'package:business/core/errors/failures.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/app_database.dart';
import 'package:business/data/models/core/target_model.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/business/business_repositories.dart';
import 'package:dartz/dartz.dart';

class BusinessRepositoriesImpl implements BusinessRepository {
  BusinessRepositoriesImpl({required AppDatabase database})
      : _database = database;

  final AppDatabase _database;

  @override
  ResultFuture<void> deleteBusinessTarget(Target target) async {
    try {
      final result = await _database.businessTargetDao
          .deleteBusinessTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> editBusinessTarget(Target target) async {
    try {
      final result = await _database.businessTargetDao
          .editBusinessTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<Target>> getBusinessTargets() async {
    try {
      final result = await _database.businessTargetDao.getBusinessTargets();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> saveBusinessTarget(Target target) async {
    try {
      final result = await _database.businessTargetDao
          .saveBusinessTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
