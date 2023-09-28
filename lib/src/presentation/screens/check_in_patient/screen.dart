import 'package:flutter/material.dart';

class CheckInPatientScreen extends StatefulWidget {
  const CheckInPatientScreen({Key? key}) : super(key: key);

  @override
  State<CheckInPatientScreen> createState() => _CheckInPatientScreenState();
}

class _CheckInPatientScreenState extends State<CheckInPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Check in patient screen'),
      ),
    );
  }
}
