import 'package:business/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class Target extends Equatable {
  const Target({
    required this.id,
    required this.name,
    required this.category,
    required this.weight,
    required this.status,
    required this.type,
    required this.startDate,
    required this.endDate,
  });

  final String id;
  final String name;
  final Category category;
  final int weight;
  final Status status;
  final TargetType type;
  final DateTime startDate;
  final DateTime endDate;

  @override
  List<Object?> get props =>
      [id, name, category, weight, status, type, startDate, endDate];

  Target copyWith({
    String? id,
    String? name,
    Category? category,
    int? weight,
    Status? status,
    TargetType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Target(
      id: id ?? this.id,
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
