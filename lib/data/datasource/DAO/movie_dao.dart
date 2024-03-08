import 'package:business/data/models/core/target_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class TargetDao {
  @insert
  Future<void> saveMovie(TargetModel target);

  @delete
  Future<void> deleteSavedMovie(TargetModel target);

  @Query('SELECT * FROM movies WHERE type = product')
  Future<List<TargetModel>> getProductTargets();
}
