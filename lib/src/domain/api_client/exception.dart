abstract class ApiClientException implements Exception{
  const ApiClientException();
}

class NetworkException extends ApiClientException {
  const NetworkException();
}

class BadRequestException extends ApiClientException {
  const BadRequestException();
}

class UnauthorizedException extends ApiClientException {
  const UnauthorizedException();
}

class NotFoundException extends ApiClientException {
  const NotFoundException();
}

class ServerFailedException extends ApiClientException {
  const ServerFailedException();
}

class ParseException extends ApiClientException {
  const ParseException();
}