import 'package:application/src/utils/resources/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
        splashColor: AppColors.transparentColor,
        highlightColor: AppColors.transparentColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.blackColor),
        ),
        inputDecorationTheme: TextInputDecoration.textInputDecorationTheme,
      );
}

abstract class TextInputDecoration {
  static const _borderRadius = BorderRadius.all(
    Radius.circular(10),
  );

  static const _border = OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(
      color: AppColors.inputBorderColor,
    ),
  );

  static const _disabledBorder = OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(
      color: AppColors.inputBorderColor,
    ),
  );

  static const _errorBorder = OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(
      color: AppColors.redColor,
    ),
  );

  static const textInputDecorationTheme = InputDecorationTheme(
    enabledBorder: _border,
    errorBorder: _errorBorder,
    focusedBorder: _border,
    disabledBorder: _disabledBorder,
    focusedErrorBorder: _errorBorder,
    border: _border,
    hintStyle: TextStyle(fontSize: 15),
    errorStyle: TextStyle(
      color: AppColors.redColor,
      fontSize: 14,
    ),
  );
}
