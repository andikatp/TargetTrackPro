import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/user.dart';
import 'package:business/domain/repositories/auth/auth_repository.dart';

class Register implements UseCaseWithParams<void, User> {
  Register({required AuthRepository repository}) : _repository = repository;
  final AuthRepository _repository;

  @override
  ResultFuture<void> call(User user) => _repository.register(user: user);
}
