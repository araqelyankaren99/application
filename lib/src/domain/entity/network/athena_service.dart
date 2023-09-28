import 'package:json_annotation/json_annotation.dart';

part 'athena_service.g.dart';

@JsonSerializable()
class AthenaService {
  const AthenaService({
    required this.id,
    required this.title,
    required this.price,
    required this.icon,
    required this.color,
    this.description,
  });

  factory AthenaService.fromJson(Map<String, dynamic> json) =>
      _$AthenaServiceFromJson(json);

  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final String? icon;
  final String? color;

  Map<String, dynamic> toJson() => _$AthenaServiceToJson(this);
}
