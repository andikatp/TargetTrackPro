import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'target_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'target', primaryKeys: ['id'])
class TargetModel extends Target {
  const TargetModel({
    required super.id,
    required super.name,
    required super.category,
    required super.weight,
    required super.status,
    required super.type,
    required super.startDate,
    required super.endDate,
  });

  factory TargetModel.fromEntity(Target target) {
    return TargetModel(
      id: target.id,
      name: target.name,
      category: target.category,
      weight: target.weight,
      status: target.status,
      type: target.type,
      startDate: target.startDate,
      endDate: target.endDate,
    );
  }

  factory TargetModel.fromJson(Map<String, dynamic> json) =>
      _$TargetModelFromJson(json);
  Map<String, dynamic> toJson() => _$TargetModelToJson(this);
}
