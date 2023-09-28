import 'package:application/src/utils/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PermissionTextWidget extends StatelessWidget {
  const PermissionTextWidget({Key? key, required this.permissionMessage})
      : super(key: key);

  final String permissionMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 122 * rw(context)),
      child: Padding(
        padding: EdgeInsets.only(top: 20 * rh(context)),
        child: AspectRatio(
          aspectRatio: 944 / 370,
          child: Center(
            child: AutoSizeText(
              permissionMessage,
              textAlign: TextAlign.center,
              minFontSize: 16,
              maxFontSize: 28,
              style: TextStyle(fontSize: 28 * rw(context)),
            ),
          ),
        ),
      ),
    );
  }
}