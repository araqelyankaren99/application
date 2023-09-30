import 'package:application/src/data/data_provider/app_config.dart';
import 'package:application/src/domain/entity/local/app_config.dart';
import 'package:application/src/utils/enum/app_mode.dart';
import 'package:application/src/utils/extensions/app_mode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigService {
  const AppConfigService();

  static const _appConfigDataProvider = AppConfigDataProvider();

  Future<void> initAppConfig(ApplicationMode applicationMode) async{
    final path = applicationMode.path();
    await dotenv.load(fileName: path);
    final jsonEnv = dotenv.env;
    final appConfig = AppConfig.fromJson(jsonEnv);
    _appConfigDataProvider.appConfig = appConfig;
  }
}