// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

part of 'target_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TargetModel _$TargetModelFromJson(Map<String, dynamic> json) => TargetModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      weight: json['weight'] as int,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      type: $enumDecode(_$TargetTypeEnumMap, json['type']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$TargetModelToJson(TargetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$CategoryEnumMap[instance.category]!,
      'weight': instance.weight,
      'status': _$StatusEnumMap[instance.status]!,
      'type': _$TargetTypeEnumMap[instance.type]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };

const _$CategoryEnumMap = {
  Category.quantitative: 'quantitative',
  Category.qualitative: 'qualitative',
};

const _$StatusEnumMap = {
  Status.toDo: 'toDo',
  Status.inProgress: 'inProgress',
  Status.done: 'done',
};

const _$TargetTypeEnumMap = {
  TargetType.product: 'product',
  TargetType.business: 'business',
  TargetType.marketing: 'marketing',
};
