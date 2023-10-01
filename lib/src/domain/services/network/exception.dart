import 'package:application/src/domain/api_client/exception.dart';
import 'package:http/http.dart' as http;

class HttpExceptionService {
  const HttpExceptionService();

  void handle(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw const BadRequestException();
      case 401:
      case 403:
        throw const UnauthorizedException();
      case 404:
        throw const NotFoundException();
      case 500:
        throw const ServerFailedException();
      default:
       break;
    }
  }
}