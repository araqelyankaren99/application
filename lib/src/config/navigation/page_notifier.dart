import 'package:application/src/config/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PageNotifier extends ChangeNotifier {
  String get pageName => _pageName;
  String _pageName = GetIt.I<MainNavigation>().initialRoute;

  set pageName(String pageName) {
    if(pageName.isEmpty){
      return;
    }

    if(_pageName == pageName){
      return;
    }

    if (_pageName != pageName) {
      _pageName = pageName;
      notifyListeners();
    }
  }
}