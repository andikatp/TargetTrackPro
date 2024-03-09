import 'dart:async';
import 'package:business/core/utils/enums.dart';
import 'package:business/data/datasource/auth/DAO/user_dao.dart';
import 'package:business/data/models/core/user_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'user_database.g.dart';

@Database(version: 1, entities: [UserModel])
abstract class UserDatabase extends FloorDatabase {
  UserDao get userDao;
}
