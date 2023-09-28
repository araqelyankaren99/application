import 'package:application/src/presentation/screens/upload_insurance/bloc/event.dart';
import 'package:application/src/presentation/screens/upload_insurance/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadInsuranceBloc extends Bloc<UploadInsuranceEvent,UploadInsuranceState>{
  UploadInsuranceBloc() : super(const UploadInsuranceInitial());
}