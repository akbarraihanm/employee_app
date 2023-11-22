import 'package:employee_app/di/app_locator.dart';
import 'package:employee_app/domain/register/data/data_source/register_data_source.dart';
import 'package:employee_app/domain/register/data/repository/register_repository_impl.dart';
import 'package:employee_app/domain/register/data/service/register_service.dart';
import 'package:employee_app/domain/register/domain/repository/register_repository.dart';
import 'package:employee_app/domain/register/domain/use_case/do_register_use_case.dart';

class RegisterLocator {
  RegisterLocator() {
    sl.registerLazySingleton(() => RegisterService());
    sl.registerLazySingleton<RegisterDataSource>(() => RegisterDataSourceImpl(sl()));
    sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl()));
    sl.registerLazySingleton(() => DoRegisterUseCase(sl()));
  }
}