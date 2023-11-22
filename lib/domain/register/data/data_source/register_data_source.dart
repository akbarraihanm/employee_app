import 'package:employee_app/domain/register/data/models/body/register_body.dart';
import 'package:employee_app/domain/register/data/models/response/register_response.dart';
import 'package:employee_app/domain/register/data/service/register_service.dart';

abstract class RegisterDataSource {
  Future<RegisterResponse> register(RegisterBody body);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final RegisterService service;

  RegisterDataSourceImpl(this.service);

  @override
  Future<RegisterResponse> register(RegisterBody body) {
    return service.register(body);
  }

}