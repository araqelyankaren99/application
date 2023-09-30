import 'package:application/src/domain/entity/network/patient_info.dart';

PatientInfo? _patientInfo;

class PatientInfoDataProvider {
  const PatientInfoDataProvider();

  PatientInfo? get patientInfo => _patientInfo;

  set patientInfo(PatientInfo? patientInfo) {
    if(_patientInfo == patientInfo){
      return;
    }
    patientInfo = patientInfo;
  }
}