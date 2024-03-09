import 'package:business/core/utils/enums.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/user.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<User> login({required String email, required String password});
  ResultFuture<void> register({
    required String email,
    required String password,
    required UserRole role,
  });
}
