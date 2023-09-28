import 'package:equatable/equatable.dart';

abstract class UploadInsuranceState extends Equatable {
  const UploadInsuranceState();

  @override
  List<Object?> get props => [];
}

class UploadInsuranceInitial extends UploadInsuranceState {
  const UploadInsuranceInitial();
}