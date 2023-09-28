import 'package:equatable/equatable.dart';

abstract class CheckInPatientState extends Equatable {
  const CheckInPatientState();
  @override
  List<Object?> get props => [];
}

class CheckInPatientInitial extends CheckInPatientState {
  const CheckInPatientInitial();
}
