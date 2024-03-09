import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';

abstract class MarketingRepository {
  const MarketingRepository();

   ResultFuture<List<Target>> getMarketingTargets();
   ResultFuture<void> saveMarketingTarget(Target target);
   ResultFuture<void> editMarketingTarget(Target target);
   ResultFuture<void> deleteMarketingTarget(Target target);
}
