import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/repositories/main/main_repository.dart';

class LogOut implements UseCaseWithOutParams<void> {
  LogOut({required MainRepository repository}) : _repository = repository;

  final MainRepository _repository;

  @override
  ResultFuture<void> call() => _repository.logOut();
}
