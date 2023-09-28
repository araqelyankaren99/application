import 'package:application/src/presentation/screens/book_return_visit/bloc/event.dart';
import 'package:application/src/presentation/screens/book_return_visit/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookReturnVisitBloc extends Bloc<BookReturnVisitEvent,BookReturnVisitState>{
  BookReturnVisitBloc() : super(const BookReturnVisitInitial());
}