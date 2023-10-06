import 'package:application/src/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class RestartTextWidget extends StatelessWidget {
  const RestartTextWidget({
    required this.text,
    this.fontSize = 15,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
    );
  }
}
