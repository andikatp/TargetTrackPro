import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:floor/floor.dart';

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

  factory TargetModel.fromJson(Map<String, dynamic> map) {
    return TargetModel(
      id: map['id'] as String,
      name: map['name'] as String,
      category: Category.fromJson(map['category'] as String),
      weight: map['weight'] as int,
      status: Status.fromJson(map['status'] as String),
      type: TargetType.fromJson(map['type'] as String),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category.toJson(),
      'weight': weight,
      'status': status.toJson(),
      'type': type.toJson(),
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
    };
  }

  TargetModel copyWith({
    String? name,
    Category? category,
    int? weight,
    Status? status,
    TargetType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return TargetModel(
      id: id,
      name: name ?? this.name,
      category: category ?? this.category,
      weight: weight ?? this.weight,
      status: status ?? this.status,
      type: type ?? this.type,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
