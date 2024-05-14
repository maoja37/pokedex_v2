import 'package:pokedex_v2/global/storage/app_storage.dart';
import 'package:pokedex_v2/locator.dart';

class AppManager {
 static Future<void> initialize() async {
    await setupLocator();

    await locator<AppStorage>().init();
  }
}
