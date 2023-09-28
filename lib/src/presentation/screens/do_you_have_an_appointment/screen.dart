import 'package:flutter/material.dart';

class DoYouHaveAnAppointmentScreen extends StatefulWidget {
  const DoYouHaveAnAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<DoYouHaveAnAppointmentScreen> createState() =>
      _DoYouHaveAnAppointmentScreenState();
}

class _DoYouHaveAnAppointmentScreenState
    extends State<DoYouHaveAnAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Do you have an appointment screen'),
      ),
    );
  }
}
