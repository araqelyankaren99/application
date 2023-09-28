import 'package:application/src/presentation/screens/login/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginBloc,LoginState>{
  LoginBloc() : super(const LoginInitial());
}