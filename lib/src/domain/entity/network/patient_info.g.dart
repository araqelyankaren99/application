// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) => PatientInfo(
      patientId: json['patient_id'] as int?,
      appointmentId: json['appointment_id'] as int?,
      hasHipaa: json['has_hipaa'] as bool?,
      hasConsent: json['has_consent'] as bool?,
      hasId: json['has_id'] as bool?,
      hasAddress: json['has_address'] as bool?,
      hasInsurance: json['has_insurance'] as bool?,
      skipUrl: json['skip_url'] as String?,
      secondaryInsurance: json['secondary_insurance'] as bool?,
      success: json['success'] as bool?,
      successMessage: json['success_message'] == null
          ? null
          : CongratulationMessage.fromJson(
              json['success_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientInfoToJson(PatientInfo instance) =>
    <String, dynamic>{
      'patient_id': instance.patientId,
      'appointment_id': instance.appointmentId,
      'has_hipaa': instance.hasHipaa,
      'has_consent': instance.hasConsent,
      'has_id': instance.hasId,
      'has_address': instance.hasAddress,
      'has_insurance': instance.hasInsurance,
      'skip_url': instance.skipUrl,
      'secondary_insurance': instance.secondaryInsurance,
      'success': instance.success,
      'success_message': instance.successMessage?.toJson(),
    };
