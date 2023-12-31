import 'package:application/src/config/app_config/app_config.dart';

AppConfig _appConfig = const AppConfig(host: '', socketHost: '', headersType: '');

class AppConfigDataProvider {
  const AppConfigDataProvider();

  AppConfig get appConfig => _appConfig;

  set appConfig(AppConfig appConfig) {
    if(_appConfig == appConfig){
      return;
    }
    _appConfig = appConfig;
  }
}