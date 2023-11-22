import 'package:employee_app/domain/register/data/models/response/register_response.dart';
import 'package:employee_app/domain/register/domain/entity/register_entity.dart';

extension RegisterToEntity on RegisterResponse {
  RegisterEntity toEntity() => RegisterEntity(
    name: name ?? "",
    job: job ?? "",
    id: id ?? "",
    createdAt: createdAt ?? "",
  );
}