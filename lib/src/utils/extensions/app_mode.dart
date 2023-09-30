import 'package:application/src/utils/enum/app_mode.dart';

extension ApplicationModeExtension on ApplicationMode {
  String path() {
    var path = '';
    const prefixPath = 'assets/env/';
    const suffixPath = '.env';
    path = prefixPath;
    switch(this){
      case ApplicationMode.local:
        path += 'local';
        break;
      case ApplicationMode.dev:
        path += 'dev';
        break;
      case ApplicationMode.prod:
        path += 'prod';
    }
    return path + suffixPath;
  }
}
