import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/business/business_repositories.dart';

class DeleteBusinessTarget implements UseCaseWithParams<void, Target> {
  DeleteBusinessTarget({required BusinessRepository repository})
      : _repository = repository;
  final BusinessRepository _repository;

  @override
  ResultFuture<void> call(Target params) =>
      _repository.deleteBusinessTarget(params);
}
