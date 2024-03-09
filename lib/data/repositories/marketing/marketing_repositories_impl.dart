import 'package:business/core/errors/failures.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/app_database.dart';
import 'package:business/data/models/core/target_model.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/marketing/marketing_repositories.dart';
import 'package:dartz/dartz.dart';

class MarketingRepositoriesImpl implements MarketingRepository {
  MarketingRepositoriesImpl({required AppDatabase database})
      : _database = database;

  final AppDatabase _database;

  @override
  ResultFuture<void> deleteMarketingTarget(Target target) async {
    try {
      final result = await _database.marketingTargetDao
          .deleteMarketingTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> editMarketingTarget(Target target) async {
    try {
      final result = await _database.marketingTargetDao
          .editMarketingTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<Target>> getMarketingTargets() async {
    try {
      final result = await _database.marketingTargetDao.getMarketingTargets();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> saveMarketingTarget(Target target) async {
    try {
      final result = await _database.marketingTargetDao
          .saveMarketingTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
