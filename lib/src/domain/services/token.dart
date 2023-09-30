import 'package:application/src/data/data_provider/token.dart';

class TokenService {
  const TokenService();

  static const _tokenDataProvider = TokenDataProvider();

  void saveToken(String token) {
    _tokenDataProvider.token = token;
  }

  void removeToken() {
    _tokenDataProvider.token = null;
  }
}