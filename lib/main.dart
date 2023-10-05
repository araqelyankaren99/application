import 'package:application/service_locator.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  final screenFactory = GetIt.I<ScreenFactory>();
  runApp(screenFactory.makeMyApp());
}

extension StringSizeExtension on String {
  /// One line height of text
  double heightOfText(BuildContext context, TextStyle textStyle) {
    final constraints =
    BoxConstraints(maxHeight: MediaQuery.of(context).size.height);

    final renderParagraph = RenderParagraph(
      TextSpan(
        text: this,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      maxLines: 1,
    )..layout(constraints);

    final textLen = renderParagraph
        .getMinIntrinsicHeight(textStyle.fontSize ?? 13)
        .ceilToDouble();

    return textLen;
  }

  /// This method will return phone number without scope is
  String phoneNumberWithoutScope() {
    return replaceAll('(', '').replaceAll(')', '').replaceAll('-', '');
  }

  /// This method removes brackets from string
  String removeBrackets() {
    return replaceAll(
        RegExp(
          '{',
        ),
        '')
        .replaceAll(
        RegExp(
          '}',
        ),
        '');
  }

  String? smsCodeVerifyPinParser() {
    return RegExp(r'(\d{6})').stringMatch(this);
  }

  /// This method checks pin code is valid or not
  bool isValidPin() {
    return length == 6;
  }
}