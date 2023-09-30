String? _token;

class TokenDataProvider {
  const TokenDataProvider();

  String? get token => _token;

  set token(String? token) {
    if(token == _token){
      return;
    }
    _token = token;
  }
}
