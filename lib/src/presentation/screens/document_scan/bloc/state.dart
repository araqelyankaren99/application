import 'package:equatable/equatable.dart';

abstract class DocumentScanState extends Equatable {
  const DocumentScanState();

  @override
  List<Object?> get props => [];
}

class DocumentScanInitial extends DocumentScanState {
  const DocumentScanInitial();
}