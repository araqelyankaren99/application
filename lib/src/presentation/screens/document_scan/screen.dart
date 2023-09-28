import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

typedef OnGetImage = void Function(XFile?);

class DocumentScanScreen extends StatefulWidget {
  const DocumentScanScreen({Key? key,required this.onGetImage}) : super(key: key);

  final OnGetImage onGetImage;

  @override
  State<DocumentScanScreen> createState() => _DocumentScanScreenState();
}

class _DocumentScanScreenState extends State<DocumentScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
