import 'dart:async';

import 'package:application/src/data/data_provider/permission/enabled.dart';
import 'package:application/src/domain/providers/bloc/internet/event.dart';
import 'package:application/src/domain/providers/bloc/internet/state.dart';
import 'package:application/src/domain/services/internet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(const InternetInitial()) {
    on<ListenInternetChangesEvent>(_onListenInternetChangesEventToState);
    on<LoseInternetEvent>(_onLoseInternetEventToState);
    on<FirstTimeActiveInternetEvent>(_onFirstTimeActiveInternetEventToState);
    on<ActiveInternetEvent>(_onActiveInternetEventToState);
    add(const ListenInternetChangesEvent());
  }


  StreamSubscription<bool>? _internetSubscription;

  bool _firstTimeCheck = true;

  Future<void> _onListenInternetChangesEventToState(
    ListenInternetChangesEvent event,
    Emitter<InternetState> emit,
  ) async {
    const enabledDataProvider = PermissionEnabledDataProvider();
    final hasEnabledPermission = enabledDataProvider.hasEnabledPermission;
    if (!hasEnabledPermission) {
      return;
    }
    final internetService = InternetService();
    _internetSubscription =
        internetService.onStatusChange.listen(_onInternetStatusChange);
  }

  Future<void> _onLoseInternetEventToState(
    LoseInternetEvent event,
    Emitter<InternetState> emit,
  ) async {
    emit(const LoseInternetState());
  }

  Future<void> _onFirstTimeActiveInternetEventToState(
    FirstTimeActiveInternetEvent event,
    Emitter<InternetState> emit,
  ) async {
    emit(const FirstTimeActiveInternetState());
  }

  Future<void> _onActiveInternetEventToState(
    ActiveInternetEvent event,
    Emitter<InternetState> emit,
  ) async {
    emit(const ActiveInternetState());
  }

  void _onInternetStatusChange(bool hasInternet) {
    if(_firstTimeCheck){
      if(hasInternet){
        add(const FirstTimeActiveInternetEvent());
          return;
      }
    }
    _firstTimeCheck = false;

    final nextEvent =
        hasInternet ? const ActiveInternetEvent() : const LoseInternetEvent();
    add(nextEvent);
  }


  @override
  Future<void> close() async {
    _internetSubscription?.cancel();
    super.close();
  }
}
