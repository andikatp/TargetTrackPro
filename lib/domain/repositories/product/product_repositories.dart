import 'package:business/core/utils/typedef.dart';
import 'package:business/domain/entities/core/target.dart';

abstract class ProductRepository {
  const ProductRepository();

   ResultFuture<List<Target>> getProductTargets();
   ResultFuture<void> saveProductTarget(Target target);
   ResultFuture<void> editProductTarget(Target target);
   ResultFuture<void> deleteProductTarget(Target target);
}
