import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/product/product_repositories.dart';

class SaveTargetProduct implements UseCaseWithParams<void, Target> {
  SaveTargetProduct({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  @override
  ResultFuture<void> call(Target params) =>
      _repository.saveTargetProduct(params);
}
