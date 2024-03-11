import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:business/core/errors/failures.dart';
import 'package:business/core/services/notification_service.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/core/app_database.dart';
import 'package:business/data/models/core/target_model.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/marketing/marketing_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketingRepositoriesImpl implements MarketingRepository {
  MarketingRepositoriesImpl({
    required AppDatabase database,
    required SharedPreferences preferences,
  })  : _database = database,
        _preferences = preferences;

  final AppDatabase _database;
  final SharedPreferences _preferences;

  @override
  ResultFuture<void> deleteMarketingTarget(Target target) async {
    try {
      final result = await _database.marketingTargetDao
          .deleteMarketingTarget(TargetModel.fromEntity(target));
      await NotificationService.cancel(target.id.hashCode);
      await _preferences.remove('target_${target.endDate}');
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
      final key = 'target_${target.endDate}';
      await _preferences.setString(key, target.name);
      await AndroidAlarmManager.oneShotAt(
        target.endDate.subtract(const Duration(days: 1)),
        target.id.hashCode,
        NotificationService.callback,
        exact: true,
        wakeup: true,
      );
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
      final key = 'target_${target.endDate}';
      await _preferences.setString(key, target.name);
      await AndroidAlarmManager.oneShotAt(
        target.endDate.subtract(const Duration(days: 1)),
        target.id.hashCode,
        NotificationService.callback,
        exact: true,
        wakeup: true,
      );
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
