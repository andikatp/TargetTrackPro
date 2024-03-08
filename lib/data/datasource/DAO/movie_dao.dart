import 'package:business/data/models/core/target_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class TargetDao {
  @insert
  Future<void> saveProductTarget(TargetModel target);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> editProductTarget(TargetModel target);

  @delete
  Future<void> deleteProductTarget(TargetModel target);

  @Query('SELECT * FROM movies WHERE type = product')
  Future<List<TargetModel>> getProductTargets();
}
