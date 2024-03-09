import 'package:business/core/errors/exceptions.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/data/datasource/auth/user_database.dart';
import 'package:business/data/models/core/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();

  Future<UserModel> login({required String email, required String password});
  Future<void> register({
    required String email,
    required String password,
    required UserRole role,
  });
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({
    required SharedPreferences preference,
    required UserDatabase database,
  })  : _preference = preference,
        _database = database;

  final SharedPreferences _preference;
  final UserDatabase _database;

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _database.userDao.login(email);
      if (user == null) {
        throw const CacheException(message: 'User not found! Please register');
      }
      if (user.password != password) {
        throw const CacheException(
          message: 'Password is incorrect! Please check your password.',
        );
      }
      await _preference.setBool('isLoggedIn', true);
      return user;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    try {
      final isUserExist = await _database.userDao.login(email);
      if (isUserExist != null) {
        throw const CacheException(
          message: 'User already exists! Please login',
        );
      }
      final newUser = UserModel(email: email, password: password, role: role);
      await _database.userDao.register(newUser);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
