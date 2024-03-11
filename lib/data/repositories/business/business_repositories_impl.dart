import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:business/core/errors/failures.dart';
import 'package:business/core/services/notification_service.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/data/datasource/core/app_database.dart';
import 'package:business/data/models/core/target_model.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/business/business_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessRepositoriesImpl implements BusinessRepository {
  BusinessRepositoriesImpl({
    required AppDatabase database,
    required SharedPreferences preferences,
  })  : _database = database,
        _preferences = preferences;

  final AppDatabase _database;
  final SharedPreferences _preferences;

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
      await AndroidAlarmManager.oneShotAt(
        target.endDate.subtract(const Duration(days: 1)),
        1,
        () => NotificationService.showNotification(
          body: "🎯 Don't forget! ${target.name} is waiting "
              'to be finished by tomorrow!',
          payload: '',
        ),
        exact: true,
        wakeup: true,
      );
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
      final uniqueId = '${target.id}_${DateTime.now().millisecondsSinceEpoch}';
      await _preferences.setString('target_name', target.name);
      print(target.name);
      await AndroidAlarmManager.oneShotAt(
        DateTime.now().add(const Duration(seconds: 10)),
        uniqueId.hashCode,
        NotificationService.callback,
        exact: true,
        wakeup: true,
      );
      return Right(result);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
