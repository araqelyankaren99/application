import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureBodyWidget extends StatelessWidget {
  const SignatureBodyWidget({
    Key? key,
    required this.signatureController,
    required this.height,
    required this.width,
    required this.backgroundColor,
  }) : super(key: key);

  final SignatureController signatureController;
  final double width;
  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Signature(
      controller: signatureController,
      backgroundColor: backgroundColor,
      width: width,
      height: height,
    );
  }
}