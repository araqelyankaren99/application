import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GlobalLoaderWidget extends StatelessWidget {
  const GlobalLoaderWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading : false,
      overlayColor: const Color(0xFFC6EBFF),
      overlayOpacity: 0.8,
      overlayWidget: const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.black,
        ),
      ),
      child: child,
    );
  }
}
