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
  AuthLocalDataSourceImpl(
      {required SharedPreferences preference, required UserDatabase database,})
      : _preference = preference,
        _database = database;

  final SharedPreferences _preference;
  final UserDatabase _database;

  @override
  Future<UserModel> login(
      {required String email, required String password,}) async {
    return UserModel(email: email, password: password, role: UserRole.business);
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required UserRole role,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
