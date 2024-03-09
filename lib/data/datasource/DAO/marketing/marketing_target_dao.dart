import 'package:business/data/models/core/target_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class MarketingTargetDao {
  @insert
  Future<void> saveMarketingTarget(TargetModel target);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> editMarketingTarget(TargetModel target);

  @delete
  Future<void> deleteMarketingTarget(TargetModel target);

  @Query('SELECT * FROM target WHERE type = 0')
  Future<List<TargetModel>> getMarketingTargets();
}
