import 'package:equatable/equatable.dart';

abstract class CheckIsActiveEvent extends Equatable{
  const CheckIsActiveEvent();

  @override
  List<Object> get props => [];
}

class CheckActivationEvent extends CheckIsActiveEvent{
  const CheckActivationEvent();
}

class ChangeCanReconnectTimerValueEvent extends CheckIsActiveEvent{
  const ChangeCanReconnectTimerValueEvent({required this.canReconnect});

  final bool canReconnect;

  @override
  List<Object> get props => [canReconnect];
}

class ReconnectTimerEvent extends CheckIsActiveEvent{
  const ReconnectTimerEvent();
}

class GlobalTimerDurationChangedEvent extends CheckIsActiveEvent {
  const GlobalTimerDurationChangedEvent({required this.currentDurationInSeconds});

  final int currentDurationInSeconds;

  @override
  List<Object> get props => [currentDurationInSeconds];
}

class GlobalTimerVisibleChangedEvent extends CheckIsActiveEvent {
  const GlobalTimerVisibleChangedEvent({required this.showGlobalTimer});

  final bool showGlobalTimer;

  @override
  List<Object> get props => [showGlobalTimer];
}

class RepeatTimerValueChangedEvent extends CheckIsActiveEvent {
  const RepeatTimerValueChangedEvent({required this.isRepeat});

  final bool isRepeat;

  @override
  List<Object> get props => [isRepeat];
}