import 'package:flutter/material.dart';

class UploadInsuranceScreen extends StatefulWidget {
  const UploadInsuranceScreen({Key? key}) : super(key: key);

  @override
  State<UploadInsuranceScreen> createState() => _UploadInsuranceScreenState();
}

class _UploadInsuranceScreenState extends State<UploadInsuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Upload insurance screen'),
      ),
    );
  }
}
