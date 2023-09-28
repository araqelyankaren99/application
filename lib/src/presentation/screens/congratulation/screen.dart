import 'package:application/src/domain/entity/network/qr_upload_model.dart';
import 'package:flutter/material.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({Key? key, required this.qrUploadModel})
      : super(key: key);

  final QrUploadModel qrUploadModel;

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Congratulation screen'),
      ),
    );
  }
}
