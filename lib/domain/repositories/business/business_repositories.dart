import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';

abstract class BusinessRepository {
  const BusinessRepository();

   ResultFuture<List<Target>> getBusinessTargets();
   ResultFuture<void> saveBusinessTarget(Target target);
   ResultFuture<void> editBusinessTarget(Target target);
   ResultFuture<void> deleteBusinessTarget(Target target);
}
