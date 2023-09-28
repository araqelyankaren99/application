import 'package:equatable/equatable.dart';

abstract class MissingPatientInfoState extends Equatable {
  const MissingPatientInfoState();

  @override
  List<Object?> get props => [];
}

class MissingPatientInfoInitial extends MissingPatientInfoState {
  const MissingPatientInfoInitial();
}