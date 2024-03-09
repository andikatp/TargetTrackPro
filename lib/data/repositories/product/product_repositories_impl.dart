import 'package:business/core/errors/failures.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/core/app_database.dart';
import 'package:business/data/models/core/target_model.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/product/product_repositories.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoriesImpl implements ProductRepository {
  ProductRepositoriesImpl({required AppDatabase database})
      : _database = database;

  final AppDatabase _database;

  @override
  ResultFuture<void> deleteProductTarget(Target target) async {
    try {
      final result = await _database.productTargetDao
          .deleteProductTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> editProductTarget(Target target) async {
    try {
      final result = await _database.productTargetDao
          .editProductTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<Target>> getProductTargets() async {
    try {
      final result = await _database.productTargetDao.getProductTargets();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> saveProductTarget(Target target) async {
    try {
      final result = await _database.productTargetDao
          .saveProductTarget(TargetModel.fromEntity(target));
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
