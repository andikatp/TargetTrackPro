import 'package:business/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class Target extends Equatable {
  const Target({
    required this.name,
    required this.category,
    required this.weight,
    required this.status,
    required this.type,
    required this.startDate,
    required this.endDate,
  });

  final String name;
  final Category category;
  final int weight;
  final Status status;
  final TargetType type;
  final DateTime startDate;
  final DateTime endDate;

  @override
  List<Object?> get props => [name, category, weight, startDate, endDate];
}
