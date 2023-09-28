import 'package:flutter/material.dart';

class MissingPatientInfoScreen extends StatefulWidget {
  const MissingPatientInfoScreen({Key? key}) : super(key: key);

  @override
  State<MissingPatientInfoScreen> createState() =>
      _MissingPatientInfoScreenState();
}

class _MissingPatientInfoScreenState extends State<MissingPatientInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Missing patient info screen'),
    );
  }
}
