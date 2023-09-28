// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrUploadModel _$QrUploadModelFromJson(Map<String, dynamic> json) =>
    QrUploadModel(
      successMessage: CongratulationMessage.fromJson(
          json['success_message'] as Map<String, dynamic>),
      secondaryInsurance: json['secondary_insurance'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$QrUploadModelToJson(QrUploadModel instance) =>
    <String, dynamic>{
      'success_message': instance.successMessage.toJson(),
      'secondary_insurance': instance.secondaryInsurance,
      'success': instance.success,
    };
