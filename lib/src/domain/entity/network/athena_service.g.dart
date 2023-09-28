// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athena_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AthenaService _$AthenaServiceFromJson(Map<String, dynamic> json) =>
    AthenaService(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      icon: json['icon'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AthenaServiceToJson(AthenaService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'icon': instance.icon,
      'color': instance.color,
    };
