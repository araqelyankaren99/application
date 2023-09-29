import 'package:application/src/utils/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SignatureTextWidget extends StatelessWidget {
  const SignatureTextWidget({
    Key? key,
    required this.signatureText,
    required this.fontWeight,
    required this.color,
  }) : super(key: key);

  final String signatureText;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      signatureText,
      maxFontSize: 20,
      minFontSize: 15,
      style: TextStyle(
        fontSize: 20 * rw(context),
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
