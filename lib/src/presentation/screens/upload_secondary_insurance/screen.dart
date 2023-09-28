import 'package:flutter/material.dart';

class UploadSecondaryInsuranceScreen extends StatefulWidget {
  const UploadSecondaryInsuranceScreen({Key? key}) : super(key: key);

  @override
  State<UploadSecondaryInsuranceScreen> createState() => _UploadSecondaryInsuranceScreenState();
}

class _UploadSecondaryInsuranceScreenState extends State<UploadSecondaryInsuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Upload secondary insurance screen'),
      ),
    );
  }
}
