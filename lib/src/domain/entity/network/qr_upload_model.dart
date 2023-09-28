import 'package:application/src/domain/entity/network/congratulation_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qr_upload_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class QrUploadModel {
  const QrUploadModel({
    required this.successMessage,
    required this.secondaryInsurance,
    required this.success,
  });

  factory QrUploadModel.fromJson(Map<String, dynamic> json) =>
      _$QrUploadModelFromJson(json);

  final CongratulationMessage successMessage;
  final bool secondaryInsurance;
  final bool success;

  Map<String, dynamic> toJson() => _$QrUploadModelToJson(this);
}
