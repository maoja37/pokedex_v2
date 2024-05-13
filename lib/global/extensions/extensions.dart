import 'dart:developer' as dev;

extension AppLogger on Object {
  void log() =>  dev.log(toString());
}