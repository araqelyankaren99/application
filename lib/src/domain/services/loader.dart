import 'package:application/src/data/data_provider/loader.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderService {
  const LoaderService();

  static const _loaderDataProvider = LoaderDataProvider();

  void showLoader(BuildContext context) {
    context.loaderOverlay.show();
    _loaderDataProvider.isLoading = true;
  }

  void hideLoader(BuildContext context) {
    context.loaderOverlay.hide();
    _loaderDataProvider.isLoading = false;
  }
}