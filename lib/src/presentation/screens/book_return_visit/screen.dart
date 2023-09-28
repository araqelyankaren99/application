import 'package:flutter/material.dart';

class BookReturnVisitScreen extends StatefulWidget {
  const BookReturnVisitScreen({Key? key}) : super(key: key);

  @override
  State<BookReturnVisitScreen> createState() => _BookReturnVisitScreenState();
}

class _BookReturnVisitScreenState extends State<BookReturnVisitScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Book return visit screen'),
      ),
    );
  }
}
