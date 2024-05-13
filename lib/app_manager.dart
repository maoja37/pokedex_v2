import 'package:pokedex_v2/global/extensions/extensions.dart';
import 'package:pokedex_v2/global/storage/app_storage.dart';
import 'package:pokedex_v2/locator.dart';

class AppManager {
  static initialize() async {
    'initialize app manager'.log();
    await setupLocator();

    await locator<AppStorage>().init();
  }
}
