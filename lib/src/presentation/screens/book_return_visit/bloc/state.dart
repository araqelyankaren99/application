import 'package:equatable/equatable.dart';

abstract class BookReturnVisitState extends Equatable {
  const BookReturnVisitState();

  @override
  List<Object?> get props => [];
}

class BookReturnVisitInitial extends BookReturnVisitState {
  const BookReturnVisitInitial();
}