import 'package:application/src/presentation/screens/missing_patient_info/bloc/event.dart';
import 'package:application/src/presentation/screens/missing_patient_info/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissingPatientInfoBloc extends Bloc<MissingPatientInfoEvent,MissingPatientInfoState>{
  MissingPatientInfoBloc() : super(const MissingPatientInfoInitial());
}