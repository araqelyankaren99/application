import 'package:equatable/equatable.dart';

abstract class CongratulationState extends Equatable {
  const CongratulationState();

  @override
  List<Object?> get props => [];
}

class CongratulationInitial extends CongratulationState {
  const CongratulationInitial();
}