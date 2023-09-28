import 'package:application/src/presentation/screens/payment/bloc/event.dart';
import 'package:application/src/presentation/screens/payment/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent,PaymentState>{
  PaymentBloc() : super(const PaymentInitial());
}