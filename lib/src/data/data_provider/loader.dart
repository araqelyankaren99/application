bool _isLoading = false;

class LoaderDataProvider {
  const LoaderDataProvider();

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    if(_isLoading == isLoading){
      return;
    }
    _isLoading = isLoading;
  }
}
