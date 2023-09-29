import 'package:application/src/presentation/widgets/signature/builder.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureButtonWidget extends StatelessWidget {
  const SignatureButtonWidget({
    Key? key,
    required this.signatureController,
    required this.buttonColor,
    required this.height,
    required this.signatureButtonPadding,
    required this.signatureButtonText,
    required this.textStyle,
  }) : super(key: key);

  final SignatureController signatureController;
  final Color buttonColor;
  final double height;
  final EdgeInsets signatureButtonPadding;
  final String signatureButtonText;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SignatureBuilder(
      signatureController: signatureController,
      builder: (context, isEmptySignature) {
        return !isEmptySignature
            ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: signatureButtonPadding,
                  child: GestureDetector(
                    onTap: _clearSignature,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: height,
                        child: AspectRatio(
                          aspectRatio: 2.3,
                          child: ColoredBox(
                            color: buttonColor,
                            child: Center(
                              child: Text(
                                signatureButtonText,
                                textAlign: TextAlign.center,
                                style: textStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  void _clearSignature() {
    signatureController.clear();
  }
}
