import 'package:application/src/utils/activation/bloc/bloc.dart';
import 'package:application/src/utils/activation/bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ActivationExtension on BuildContext {
  void reconnectTimer() {
    read<CheckIsActiveBloc>().add(const ReconnectTimerEvent());
  }

  void acceptReconnect() {
    read<CheckIsActiveBloc>().add(
      const ChangeCanReconnectTimerValueEvent(
        canReconnect: true,
      ),
    );
  }

  void ignoreReconnect() {
    read<CheckIsActiveBloc>().add(
      const ChangeCanReconnectTimerValueEvent(
        canReconnect: false,
      ),
    );
  }

  void acceptRepeat() {
    read<CheckIsActiveBloc>().add(
      const RepeatTimerValueChangedEvent(
        isRepeat: true,
      ),
    );
  }

  void ignoreRepeat() {
    read<CheckIsActiveBloc>().add(
      const RepeatTimerValueChangedEvent(
        isRepeat: false,
      ),
    );
  }
}
