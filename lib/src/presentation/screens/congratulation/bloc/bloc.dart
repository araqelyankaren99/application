import 'package:application/src/presentation/screens/congratulation/bloc/event.dart';
import 'package:application/src/presentation/screens/congratulation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CongratulationBloc extends Bloc<CongratulationEvent,CongratulationState> {
  CongratulationBloc() : super(const CongratulationInitial());
}