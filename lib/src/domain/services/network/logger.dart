import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpLoggerService {
  const HttpLoggerService();
  void log(http.Response response) {
    debugPrint('Request **********');
    debugPrint('Method : ${response.request?.method}');
    debugPrint(response.request?.url.toString());
    debugPrint('Headers : ${response.request?.headers}');
    debugPrint('Status code : ${response.statusCode}');
    debugPrint('Body : ${response.body}');
  }
}