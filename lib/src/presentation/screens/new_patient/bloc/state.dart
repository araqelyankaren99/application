import 'package:equatable/equatable.dart';

abstract class NewPatientState extends Equatable {
  const NewPatientState();

  @override
  List<Object?> get props => [];
}

class NewPatientInitial extends NewPatientState {
  const NewPatientInitial();
}
