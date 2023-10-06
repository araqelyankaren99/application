import 'dart:ui';

import 'package:application/src/utils/activation/bloc/bloc.dart';
import 'package:application/src/utils/activation/bloc/state.dart';
import 'package:application/src/utils/activation/extension/activation_extension.dart';
import 'package:application/src/utils/activation/widgets/check_activation.dart';
import 'package:application/src/utils/activation/widgets/radial_percent.dart';
import 'package:application/src/utils/activation/widgets/restart_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InactiveWidget extends StatefulWidget {
  const InactiveWidget({Key? key}) : super(key: key);

  @override
  State<InactiveWidget> createState() => _InactiveWidgetState();
}

class _InactiveWidgetState extends State<InactiveWidget> {
  static final _screenWidth =  PlatformDispatcher.instance.views.first.physicalSize.width / 2;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: const Color(0xFFC6EBFF).withOpacity(0.8)),
      child: Center(
        child: SizedBox(
          height: _screenWidth,
          width: _screenWidth,
          child: const Padding(
            padding:  EdgeInsets.all(30),
            child: DecoratedBox(
              decoration:  BoxDecoration(shape: BoxShape.circle),
              child: _RadialPercentAnimationWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    RestartTextWidget(
                      text: 'Are You Here?',
                      fontSize: 22,
                    ),
                    RestartTextWidget(
                      text: 'tap “Yes” to continue, otherwise',
                    ),
                    RestartTextWidget(
                      text: 'application will restart in',
                    ),
                    _RestartWidgetAnimationCurrentTextWidget(),
                    _RestartTextButtonWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPercentAnimationWidget extends StatefulWidget {
  const _RadialPercentAnimationWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<_RadialPercentAnimationWidget> createState() =>
      _RadialPercentAnimationWidgetState();
}

class _RadialPercentAnimationWidgetState
    extends State<_RadialPercentAnimationWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initialize();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _initialize() {
    if (!_isInitialized) {
      _initializeAnimation();
      _startAnimation();
    }
    _isInitialized = true;
  }

  void _initializeAnimation() {
    final showTimerDuration = InactiveWidgetDurationProvider.of(context).showTimerDuration;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: showTimerDuration.inSeconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return RadialPercentWidget(
          percent: _animationController.value - 1,
          fillColor: const Color(0xFF3374BA),
          lineColor: const Color(0xFF72BFEA),
          freeColor: const Color(0xFFFFFFFF),
          lineWidth: 10,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  void _startAnimation() {
    _animationController.forward();
  }

  void _dispose() {
    _animationController.dispose();
  }
}

class _RestartWidgetAnimationCurrentTextWidget extends StatefulWidget {
  const _RestartWidgetAnimationCurrentTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_RestartWidgetAnimationCurrentTextWidget> createState() =>
      _RestartWidgetAnimationCurrentTextWidgetState();
}

class _RestartWidgetAnimationCurrentTextWidgetState
    extends State<_RestartWidgetAnimationCurrentTextWidget> {
  late int _currentSecond;
  bool _isInitialized = false;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initialize();
  }

  void _initialize() {
    _initializeTimerValue();
  }

  void _initializeTimerValue() {
    if (!_isInitialized) {
      final showTimerDuration = InactiveWidgetDurationProvider
          .of(context)
          .showTimerDuration;
      _currentSecond = showTimerDuration.inSeconds;
    }
    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckIsActiveBloc, CheckIsActiveState>(
      listener: _listener,
      child: RestartTextWidget(
        text: _currentSecond.toString(),
      ),
    );
  }

  void _listener(BuildContext context, CheckIsActiveState state) {
    if (state is GlobalTimerDurationChangedState) {
      _currentSecond = state.currentDurationInSeconds;
      setState(() {});
    }
  }
}

class _RestartTextButtonWidget extends StatelessWidget {
  const _RestartTextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _reconnect(context),
      child: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: RestartTextWidget(text: 'YES!', fontSize: 40),
      ),
    );
  }

  void _reconnect(BuildContext context) {
    context.reconnectTimer();
  }
}
