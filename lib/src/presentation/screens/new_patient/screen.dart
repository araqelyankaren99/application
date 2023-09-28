import 'package:flutter/material.dart';

class NewPatientScreen extends StatefulWidget {
  const NewPatientScreen({Key? key}) : super(key: key);

  @override
  State<NewPatientScreen> createState() => _NewPatientScreenState();
}

class _NewPatientScreenState extends State<NewPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('New patient screen'),
      ),
    );
  }
}
