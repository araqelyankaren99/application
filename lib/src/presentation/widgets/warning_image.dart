import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WarningImage extends StatelessWidget {
  const WarningImage({Key? key, this.width = 100}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: width,
      child: Image.asset(
        'assets/images/warning.png',
      ),
    );
  }
}
