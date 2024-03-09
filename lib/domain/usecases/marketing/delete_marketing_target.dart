import 'package:business/core/usecases/usecases.dart';
import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/repositories/marketing/marketing_repositories.dart';

class DeleteMarketingTarget implements UseCaseWithParams<void, Target> {
  DeleteMarketingTarget({required MarketingRepository repository})
      : _repository = repository;
  final MarketingRepository _repository;

  @override
  ResultFuture<void> call(Target params) =>
      _repository.deleteMarketingTarget(params);
}
