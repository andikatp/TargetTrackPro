import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Target extends Equatable {
  const Target({
    required this.name,
    required this.category,
    required this.weight,
    required this.startDate,
    required this.endDate,
  });

  final String name;
  final Category category;
  final int weight;
  final DateTime startDate;
  final DateTime endDate;

  @override
  List<Object?> get props => [name, category, weight, startDate, endDate];
}
