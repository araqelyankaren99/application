import 'package:application/src/utils/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DialogTextWidget extends StatelessWidget {
  const DialogTextWidget({
    Key? key,
    required this.text,
    this.padding,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 122 * rw(context)),
      child: Padding(
        padding: padding ?? EdgeInsets.only(top: 20 * rh(context)),
        child: AspectRatio(
          aspectRatio: 944 / 370,
          child: Center(
            child: AutoSizeText(
              text,
              textAlign: TextAlign.center,
              minFontSize: 16,
              maxFontSize: 32,
              style: TextStyle(
                fontSize: 32 * rw(context),
                color: color,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
