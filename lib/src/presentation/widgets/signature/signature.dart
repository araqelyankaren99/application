import 'package:application/src/presentation/widgets/signature/body.dart';
import 'package:application/src/presentation/widgets/signature/builder.dart';
import 'package:application/src/presentation/widgets/signature/button.dart';
import 'package:application/src/presentation/widgets/signature/text.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureWidget extends StatelessWidget {
  const SignatureWidget({
    Key? key,
    required this.signatureController,
    this.horizontalPadding = 20,
    this.aspectRatio = 131 / 60,
    this.signatureText = 'Sign Here*',
    this.backgroundColor = Colors.white,
    this.signatureTextColor = const Color(0xFF888888),
    this.signatureTextFontWeight = FontWeight.w400,
    this.signatureButtonColor = const Color(0xFFE43835),
    this.signatureButtonHeight = 40,
    this.signatureButtonPadding = const EdgeInsets.only(right: 10, top: 10),
    this.signatureButtonText = 'Clear',
    this.signatureButtonTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  }) : super(key: key);

  final SignatureController signatureController;
  final double horizontalPadding;
  final double aspectRatio;
  final String signatureText;
  final Color backgroundColor;
  final Color signatureTextColor;
  final FontWeight signatureTextFontWeight;
  final Color signatureButtonColor;
  final double signatureButtonHeight;
  final EdgeInsets signatureButtonPadding;
  final String signatureButtonText;
  final TextStyle signatureButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SignatureBodyWidget(
                  signatureController: signatureController,
                  width: constraints.maxWidth,
                  height: constraints.minHeight,
                  backgroundColor: backgroundColor,
                ),
                _SignatureTextWidget(
                  signatureController: signatureController,
                  signatureText: signatureText,
                  fontWeight: signatureTextFontWeight,
                  color: signatureTextColor,
                ),
                _SignatureButtonWidget(
                  signatureController: signatureController,
                  signatureButtonColor: signatureButtonColor,
                  signatureButtonHeight: signatureButtonHeight,
                  signatureButtonPadding: signatureButtonPadding,
                  signatureButtonText: signatureButtonText,
                  signatureButtonTextStyle: signatureButtonTextStyle,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SignatureTextWidget extends StatelessWidget {
  const _SignatureTextWidget({
    Key? key,
    required this.signatureController,
    required this.signatureText,
    required this.fontWeight,
    required this.color,
  }) : super(key: key);

  final SignatureController signatureController;
  final String signatureText;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SignatureBuilder(
      signatureController: signatureController,
      builder: (context, isEmptySignature) {
        return isEmptySignature
            ? SignatureTextWidget(
                fontWeight: fontWeight,
                signatureText: signatureText,
                color: color,
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _SignatureButtonWidget extends StatelessWidget {
  const _SignatureButtonWidget({
    Key? key,
    required this.signatureController,
    required this.signatureButtonColor,
    required this.signatureButtonHeight,
    required this.signatureButtonPadding,
    required this.signatureButtonText,
    required this.signatureButtonTextStyle,
  }) : super(key: key);

  final SignatureController signatureController;
  final Color signatureButtonColor;
  final double signatureButtonHeight;
  final EdgeInsets signatureButtonPadding;
  final String signatureButtonText;
  final TextStyle signatureButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    return SignatureButtonWidget(
      signatureController: signatureController,
      buttonColor: signatureButtonColor,
      height: signatureButtonHeight,
      signatureButtonPadding: signatureButtonPadding,
      signatureButtonText: signatureButtonText,
      textStyle: signatureButtonTextStyle,
    );
  }
}
