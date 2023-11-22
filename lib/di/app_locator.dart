import 'package:employee_app/domain/di/app_locator.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class AppLocator {
  static void init() {
    RegisterLocator();
  }
}