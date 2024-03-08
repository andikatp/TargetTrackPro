import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/product/product_repositories.dart';

class GetProductTargets implements UseCaseWithOutParams<List<Target>> {
  GetProductTargets({required ProductRepository repository})
      : _repository = repository;
  final ProductRepository _repository;

  @override
  ResultFuture<List<Target>> call() => _repository.getProductTargets();
}
