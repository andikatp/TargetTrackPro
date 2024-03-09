import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Register implements UseCaseWithParams<void, RegisterParams> {
  Register({required AuthRepository repository}) : _repository = repository;
  final AuthRepository _repository;

  @override
  ResultFuture<void> call(RegisterParams params) => _repository.register(
        email: params.email,
        password: params.password,
        role: params.role,
      );
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.email,
    required this.password,
    required this.role,
  });

  final String email;
  final String password;
  final UserRole role;

  @override
  List<Object?> get props => [email, password, role];
}
