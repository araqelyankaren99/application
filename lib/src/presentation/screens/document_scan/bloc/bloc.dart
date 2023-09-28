import 'package:application/src/presentation/screens/document_scan/bloc/event.dart';
import 'package:application/src/presentation/screens/document_scan/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentScanBloc extends Bloc<DocumentScanEvent,DocumentScanState>{
  DocumentScanBloc() : super(const DocumentScanInitial());
}