import 'dart:convert';
import 'package:application/src/domain/services/network/exception.dart';
import 'package:application/src/domain/services/network/internet.dart';
import 'package:application/src/domain/services/network/logger.dart';
import 'package:application/src/domain/services/network/parser.dart';
import 'package:application/src/domain/services/network/uri.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  const ApiClient();

  static final _client = http.Client();
  static const _uriService = UriService();
  static const _httpResponseParserService = HttpResponseParserService();
  static const _httpLoggerService = HttpLoggerService();
  static const _httpInternetCheckerService = HttpInternetCheckerService();
  static const _httpExceptionService = HttpExceptionService();

  Future<T> get<T>({
    required String path,
    Duration timeout = const Duration(seconds: 30),
    T Function(dynamic json)? parser,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
  }) async {
      await _httpInternetCheckerService.checkInternet();
      final uri = _uriService.makeUri(path: path, parameters: parameters);
      final response =
          await _client.get(uri, headers: headers).timeout(timeout);
      _httpLoggerService.log(response);
      _httpExceptionService.handle(response);
      final result = await _httpResponseParserService.parser<T>(
        response: response,
      );
      return result;
  }

  Future<T> post<T>({
    required String path,
    Duration timeout = const Duration(seconds: 30),
    T Function(dynamic json)? parser,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Encoding? encoding,
  }) async {
    await _httpInternetCheckerService.checkInternet();
    final uri = _uriService.makeUri(path: path, parameters: parameters);
    final response = await _client
        .post(
          uri,
          headers: headers,
          body: body,
          encoding: encoding,
        )
        .timeout(timeout);

    _httpLoggerService.log(response);
    _httpExceptionService.handle(response);

    final result = await _httpResponseParserService.parser<T>(
      response: response,
    );
    return result;
  }
}
