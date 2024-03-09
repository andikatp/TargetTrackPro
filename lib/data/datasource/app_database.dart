import 'dart:async';
import 'package:business/core/utils/enums.dart';
import 'package:business/data/datasource/DAO/business/business_target_dao.dart';
import 'package:business/data/datasource/DAO/marketing/marketing_target_dao.dart';
import 'package:business/data/datasource/DAO/product/product_target_dao.dart';
import 'package:business/data/models/core/target_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [TargetModel])
abstract class AppDatabase extends FloorDatabase {
  ProductTargetDao get productTargetDao;
  BusinessTargetDao get businessTargetDao;
  MarketingTargetDao get marketingTargetDao;
}

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}
