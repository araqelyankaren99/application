import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {
  const InternetState();
  @override
  List<Object?> get props => [];
}

class InternetInitial extends InternetState {
  const InternetInitial();
}

class FirstTimeActiveInternetState extends InternetState {
  const FirstTimeActiveInternetState();
}

class ActiveInternetState extends InternetState {
  const ActiveInternetState();
}

class LoseInternetState extends InternetState {
  const LoseInternetState();
}