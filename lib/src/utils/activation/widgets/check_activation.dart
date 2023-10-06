import 'package:application/src/utils/activation/bloc/bloc.dart';
import 'package:application/src/utils/activation/bloc/event.dart';
import 'package:application/src/utils/activation/bloc/state.dart';
import 'package:application/src/utils/activation/widgets/inactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnTimerVisibleChange = void Function(bool);
typedef OnTimerDurationInSecondsChange = void Function(int);

class InactiveWidgetDurationProvider extends InheritedWidget {
  const InactiveWidgetDurationProvider({
    Key? key,
    required Widget child,
    required this.showTimerDuration,
  }) : super(key: key, child: child);

  final Duration showTimerDuration;

  static InactiveWidgetDurationProvider of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<InactiveWidgetDurationProvider>();
    assert(
      result != null,
      'No InactiveWidgetDurationProvider found in context',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(InactiveWidgetDurationProvider oldWidget) {
    return true;
  }
}

class CheckActivationWidget extends StatefulWidget {
  ///This widget check you use the app or not.
  ///You can activationIntervalDuration when check in this interval you use this app
  ///and if you don't used app after showTimerDuration we show dialog message.
  ///You can customized it use parameter inActiveWidget
  ///Beginning it isn't work you must change reconnect value using context extension acceptReconnect().
  ///Beginning repeat false but you can add repeat using context extension acceptRepeat().
  ///If you want you can turn off this functionality using context extension ignoreReconnect()
  ///and turn on this functionality using acceptReconnect()
  ///
  const CheckActivationWidget({
    Key? key,
    required this.child,
    required this.activationIntervalDuration,
    required this.showTimerDuration,
    this.lazy = true,
    this.inActiveWidget,
    this.onTimerFinished,
    this.onTimerVisibleChange,
    this.onTimerDurationInSecondsChange,
  }) : super(key: key);

  final Widget child;
  final Duration activationIntervalDuration;
  final Duration showTimerDuration;
  final Widget? inActiveWidget;
  final VoidCallback? onTimerFinished;
  final OnTimerVisibleChange? onTimerVisibleChange;
  final OnTimerDurationInSecondsChange? onTimerDurationInSecondsChange;
  final bool lazy;

  @override
  State<CheckActivationWidget> createState() => _CheckActivationWidgetState();
}

class _CheckActivationWidgetState extends State<CheckActivationWidget> {
  late CheckIsActiveBloc _checkIsActiveBloc;

  bool _showTimer = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider<CheckIsActiveBloc>(
        create: (_) => _checkIsActiveBloc = CheckIsActiveBloc(
          activationIntervalDuration: widget.activationIntervalDuration,
          showTimerDuration: widget.showTimerDuration,
          lazy: widget.lazy,
        ),
        child: BlocListener<CheckIsActiveBloc, CheckIsActiveState>(
          listener: _listener,
          child: Stack(
            children: [
              Listener(
                onPointerDown: _onPointerDown,
                child: widget.child,
              ),
              _showTimer
                  ? InactiveWidgetDurationProvider(
                      showTimerDuration: widget.showTimerDuration,
                      child: const InactiveWidget(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  void _onPointerDown(_) {
    _checkIsActiveBloc.add(const ReconnectTimerEvent());
  }

  void _listener(BuildContext context, CheckIsActiveState state) {
    if (state is TimerFinishedState) {
      widget.onTimerFinished?.call();
    }

    if (state is GlobalTimerVisibleChangedState) {
      final showGlobalTimer = state.showGlobalTimer;
      _showTimer = showGlobalTimer;
      widget.onTimerVisibleChange?.call(showGlobalTimer);
      setState(() {});
    }

    if (state is GlobalTimerDurationChangedState) {
      final currentDurationInSeconds = state.currentDurationInSeconds;
      widget.onTimerDurationInSecondsChange?.call(currentDurationInSeconds);
    }
  }
}
