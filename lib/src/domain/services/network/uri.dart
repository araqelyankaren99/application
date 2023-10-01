class UriService {
  const UriService();

  Uri makeUri({
    required String path,
    Map<String, dynamic>? parameters,
  }) {
    var uri = Uri.parse(path);
    if (parameters != null) {
      uri = uri.replace(queryParameters: parameters);
    }
    return uri;
  }
}
