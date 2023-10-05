import 'package:flutter/material.dart';

abstract class MainRoute {
  const MainRoute();
  Route<Object> makeRoute() ;
}