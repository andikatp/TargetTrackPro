import 'package:business/core/utils/enums.dart';
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
  AuthLocalDataSourceImpl({required SharedPreferences preference})
      : _preference = preference;

  final SharedPreferences _preference;

  @override
  Future<UserModel> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
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
