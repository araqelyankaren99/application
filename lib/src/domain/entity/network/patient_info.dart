import 'package:application/src/domain/entity/network/congratulation_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PatientInfo {
  const PatientInfo({
    this.patientId,
    this.appointmentId,
    this.hasHipaa,
    this.hasConsent,
    this.hasId,
    this.hasAddress,
    this.hasInsurance,
    this.skipUrl,
    this.secondaryInsurance,
    this.success,
    this.successMessage,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) =>
      _$PatientInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PatientInfoToJson(this);

  final int? patientId;
  final int? appointmentId;
  final bool? hasHipaa;
  final bool? hasConsent;
  final bool? hasId;
  final bool? hasAddress;
  final bool? hasInsurance;
  final String? skipUrl;
  final bool? secondaryInsurance;
  final bool? success;
  final CongratulationMessage? successMessage;
}
