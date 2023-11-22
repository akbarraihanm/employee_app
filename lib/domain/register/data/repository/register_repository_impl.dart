import 'dart:convert';

import 'package:employee_app/core/network/api_exception.dart';
import 'package:employee_app/core/util/resource.dart';
import 'package:employee_app/domain/register/data/data_source/register_data_source.dart';
import 'package:employee_app/domain/register/data/models/body/register_body.dart';
import 'package:employee_app/domain/register/domain/entity/register_entity.dart';
import 'package:employee_app/domain/register/domain/mapper.dart';
import 'package:employee_app/domain/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);

  @override
  Future<Resource<RegisterEntity>> register(RegisterBody body) async {
    try {
      final result = await dataSource.register(body);
      return Resource.success(result.toEntity());
    } catch (ex) {
      if (ex is ErrorRequestException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(message["message"]);
      } else if (ex is NetworkException) {
        return Resource.networkError("$ex");
      } else {
        return Resource.error("$ex");
      }
    }
  }

}