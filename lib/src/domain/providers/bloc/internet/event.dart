import 'package:equatable/equatable.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object?> get props => [];
}

class ListenInternetChangesEvent extends InternetEvent {
  const ListenInternetChangesEvent();
}

class LoseInternetEvent extends InternetEvent {
  const LoseInternetEvent();
}

class FirstTimeActiveInternetEvent extends InternetEvent {
  const FirstTimeActiveInternetEvent();
}
class ActiveInternetEvent extends InternetEvent {
  const ActiveInternetEvent();
}