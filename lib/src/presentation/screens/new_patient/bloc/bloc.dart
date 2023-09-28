import 'package:application/src/presentation/screens/new_patient/bloc/event.dart';
import 'package:application/src/presentation/screens/new_patient/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPatientBloc extends Bloc<NewPatientEvent,NewPatientState>{
  NewPatientBloc() : super(const NewPatientInitial());
}