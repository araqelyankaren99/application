import 'package:application/src/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnSubmitted = void Function(String);
typedef OnChanged = void Function(String);

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    Key? key,
    required this.onChanged,
    this.enabled = true,
    this.obscureText = false,
    this.autofocus = false,
    this.suffixIcon = const SizedBox.shrink(),
    this.errorText,
    this.onSubmitted,
    this.controller,
    this.textInputAction,
    this.hintText,
    this.focusNode,
    this.textInputType,
    this.inputFormatters,
    this.labelText,
  }) : super(key: key);

  final OnChanged onChanged;
  final bool enabled;
  final OnSubmitted? onSubmitted;
  final String? errorText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool autofocus;
  final String? labelText;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    print('call build text field');
    return TextField(
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      keyboardType: textInputType,
      enabled: enabled,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      obscureText: obscureText,
      autocorrect: false,
      textInputAction: textInputAction,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        isCollapsed: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorText: errorText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 23 * rh(context),
        ),
      ),
    );
  }
}