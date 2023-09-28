import 'package:equatable/equatable.dart';

abstract class UploadIdState extends Equatable {
  const UploadIdState();

  @override
  List<Object?> get props => [];
}

class UploadIdInitial extends UploadIdState {
  const UploadIdInitial();
}