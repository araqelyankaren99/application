import 'package:application/src/domain/api_client/exception.dart';
import 'package:application/src/domain/providers/bloc/internet/bloc.dart';
import 'package:application/src/domain/providers/bloc/internet/event.dart';
import 'package:application/src/domain/services/internet.dart';
import 'package:get_it/get_it.dart';

class HttpInternetCheckerService {
  const HttpInternetCheckerService();

  static final _internetBloc = GetIt.I<InternetBloc>();
  static final _internetService = InternetService();

  Future<void> checkInternet() async{
    final hasInternet = await _internetService.hasInternet;
    if(!hasInternet){
      _internetBloc.add(const LoseInternetEvent());
      throw const NetworkException();
    }
  }
}