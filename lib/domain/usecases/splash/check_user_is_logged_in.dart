import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/repositories/splash/splash_repository.dart';

class CheckUserIsLoggedIn implements UseCaseWithOutParams<bool> {
  CheckUserIsLoggedIn({required SplashRepository repository})
      : _repository = repository;
  final SplashRepository _repository;

  @override
  ResultFuture<bool> call() => _repository.checkUserIsLoggedIn();
}
