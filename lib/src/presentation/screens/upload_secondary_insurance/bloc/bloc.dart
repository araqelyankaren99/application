
import 'package:application/src/presentation/screens/upload_secondary_insurance/bloc/event.dart';
import 'package:application/src/presentation/screens/upload_secondary_insurance/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadSecondaryInsuranceBloc extends Bloc<UploadSecondaryInsuranceEvent,UploadSecondaryInsuranceState>{
  UploadSecondaryInsuranceBloc() : super(const UploadSecondaryInsuranceInitial());
}