import 'package:employee_app/core/util/resource.dart';
import 'package:employee_app/domain/register/data/models/body/register_body.dart';
import 'package:employee_app/domain/register/domain/entity/register_entity.dart';

abstract class RegisterRepository {
  Future<Resource<RegisterEntity>> register(RegisterBody body);
}