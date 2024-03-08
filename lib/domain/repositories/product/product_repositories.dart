import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';

abstract class ProductRepository {
  const ProductRepository();

   ResultFuture<List<Target>> getTargetProducts();
   ResultFuture<void> saveTargetProduct(Target target);
   ResultFuture<void> editTargetProduct(Target target);
   ResultFuture<void> deleteTargetProduct(Target target);
}
