import 'package:application/src/data/data_provider/patient_info.dart';
import 'package:application/src/domain/entity/network/patient_info.dart';

class PatientInfoService {
  const PatientInfoService();

  static const _patientInfoDataProvider = PatientInfoDataProvider();

  void savePatientInfo(PatientInfo patientInfo) {
    _patientInfoDataProvider.patientInfo = patientInfo;
  }

  void removePatientInfo() {
    _patientInfoDataProvider.patientInfo = null;
  }
}