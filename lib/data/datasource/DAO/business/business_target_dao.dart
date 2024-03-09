import 'package:business/data/models/core/target_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class BusinessTargetDao {
  @insert
  Future<void> saveBusinessTarget(TargetModel target);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> editBusinessTarget(TargetModel target);

  @delete
  Future<void> deleteBusinessTarget(TargetModel target);

  @Query('SELECT * FROM target WHERE type = 0')
  Future<List<TargetModel>> getBusinessTargets();
}
