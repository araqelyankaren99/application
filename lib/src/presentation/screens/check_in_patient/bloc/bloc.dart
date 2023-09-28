import 'package:application/src/presentation/screens/check_in_patient/bloc/event.dart';
import 'package:application/src/presentation/screens/check_in_patient/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckInPatientBloc extends Bloc<CheckInPatientEvent,CheckInPatientState> {
  CheckInPatientBloc() : super(const CheckInPatientInitial());
}