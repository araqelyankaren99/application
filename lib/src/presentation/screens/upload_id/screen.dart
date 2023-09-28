import 'package:flutter/material.dart';

class UploadIdScreen extends StatefulWidget {
  const UploadIdScreen({
    Key? key,
    this.hideBackButton = false,
  }) : super(key: key);

  final bool hideBackButton;

  @override
  State<UploadIdScreen> createState() => _UploadIdScreenState();
}

class _UploadIdScreenState extends State<UploadIdScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Upload id screen'),
    );
  }
}
