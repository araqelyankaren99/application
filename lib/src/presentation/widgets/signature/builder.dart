import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

typedef SignatureIsEmptyBuilder = Widget Function(
  BuildContext context,
  bool isKeyboardVisible,
);

class SignatureBuilder extends StatefulWidget {
  const SignatureBuilder({
    Key? key,
    required this.builder,
    required this.signatureController,
  }) : super(key: key);

  final SignatureIsEmptyBuilder builder;
  final SignatureController signatureController;

  @override
  State<SignatureBuilder> createState() => _SignatureBuilderState();
}

class _SignatureBuilderState extends State<SignatureBuilder> {
  late bool _isEmptySignature;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  void _initialize() {
    _isEmptySignature = widget.signatureController.isEmpty;
    _addListener();
  }

  void _addListener() {
    widget.signatureController.addListener(_signatureListener);
  }

  void _removeListener() {
    widget.signatureController.removeListener(_signatureListener);
  }

  void _signatureListener() {
    final isEmptySignature = widget.signatureController.isEmpty;
    if(isEmptySignature == _isEmptySignature){
      return;
    }
    _isEmptySignature = isEmptySignature;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _isEmptySignature,
    );
  }
}
