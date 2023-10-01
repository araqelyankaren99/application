import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpResponseParserService {
  const HttpResponseParserService();
  Future<T> parser<T>({
    required http.Response response,
    T Function(dynamic json)? parser,
  }) async {
    final body = response.body;
    final json = (await jsonDecode(body));
    final result = parser?.call(json);
    return result ?? json as T;
  }
}
