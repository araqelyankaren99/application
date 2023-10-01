import 'package:flutter/material.dart';

class ReverseAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  ReverseAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
    builder: builder,
    maintainState: maintainState,
    settings: settings,
    fullscreenDialog: fullscreenDialog,);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}