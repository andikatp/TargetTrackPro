import 'dart:async';
import 'package:business/core/utils/enums.dart';
import 'package:business/data/datasource/DAO/target_dao.dart';
import 'package:business/data/models/core/target_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [TargetModel])
abstract class AppDatabase extends FloorDatabase {
  TargetDao get targetDao;
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
