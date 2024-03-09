import 'package:business/data/datasource/auth/DAO/user_dao.dart';
import 'package:business/data/models/core/user_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';


part 'user_database.g.dart';

@Database(version: 1, entities: [UserModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
