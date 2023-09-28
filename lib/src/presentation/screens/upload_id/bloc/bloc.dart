import 'package:application/src/presentation/screens/upload_id/bloc/event.dart';
import 'package:application/src/presentation/screens/upload_id/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadIdBloc extends Bloc<UploadIdEvent,UploadIdState>{
  UploadIdBloc() : super(const UploadIdInitial());
}