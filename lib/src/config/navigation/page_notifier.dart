import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  String get pageName => _pageName;
  String _pageName = '';

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