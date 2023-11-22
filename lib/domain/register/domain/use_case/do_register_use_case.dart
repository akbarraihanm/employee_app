import 'package:employee_app/core/util/resource.dart';
import 'package:employee_app/core/util/use_case.dart';
import 'package:employee_app/domain/register/data/models/body/register_body.dart';
import 'package:employee_app/domain/register/domain/entity/register_entity.dart';
import 'package:employee_app/domain/register/domain/repository/register_repository.dart';

class DoRegisterUseCase extends UseCase<RegisterEntity, RegisterBody> {
  final RegisterRepository repository;

  DoRegisterUseCase(this.repository);

  @override
  Future<Resource<RegisterEntity>> call(RegisterBody param) {
    return repository.register(param);
  }

}