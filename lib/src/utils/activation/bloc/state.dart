import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

abstract class CheckIsActiveState extends Equatable {
  const CheckIsActiveState();

  @override
  List<Object> get props => [];
}

class CheckIsActiveInitial extends CheckIsActiveState {
  const CheckIsActiveInitial();
}

class ChangeCanReconnectTimerValueState extends CheckIsActiveState {
  const ChangeCanReconnectTimerValueState({required this.canReconnect});

  final bool canReconnect;

  @override
  List<Object> get props => [canReconnect];
}

class ReconnectTimerState extends CheckIsActiveState {
  final _id = const Uuid().v4();

  @override
  List<Object> get props => [_id];
}

class RepeatTimerValueChangedState extends CheckIsActiveState {
  const RepeatTimerValueChangedState({required this.isRepeat});

  final bool isRepeat;

  @override
  List<Object> get props => [isRepeat];
}

class GlobalTimerDurationChangedState extends CheckIsActiveState {
  const GlobalTimerDurationChangedState({
    required this.currentDurationInSeconds,
  });

  final int currentDurationInSeconds;

  @override
  List<Object> get props => [currentDurationInSeconds];
}

class GlobalTimerVisibleChangedState extends CheckIsActiveState {
  const GlobalTimerVisibleChangedState({required this.showGlobalTimer});

  final bool showGlobalTimer;

  @override
  List<Object> get props => [showGlobalTimer];
}

class TimerFinishedState extends CheckIsActiveState {
  const TimerFinishedState();
}
