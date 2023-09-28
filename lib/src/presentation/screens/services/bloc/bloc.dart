import 'package:application/src/presentation/screens/services/bloc/event.dart';
import 'package:application/src/presentation/screens/services/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesBloc extends Bloc<ServicesEvent,ServicesState>{
  ServicesBloc() : super(const ServicesInitial());
}