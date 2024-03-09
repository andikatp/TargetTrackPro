import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/user.dart';
import 'package:business/domain/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Login implements UseCaseWithParams<User, LoginParams> {
  Login({required AuthRepository repository}) : _repository = repository;
  final AuthRepository _repository;

  @override
  ResultFuture<User> call(LoginParams params) =>
      _repository.login(email: params.email, password: params.password);
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
