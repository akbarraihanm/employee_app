import 'package:employee_app/core/network/http_helper.dart';
import 'package:employee_app/core/network/url_helper.dart';
import 'package:employee_app/domain/register/data/models/body/register_body.dart';
import 'package:employee_app/domain/register/data/models/response/register_response.dart';

class RegisterService extends HttpHelper {
  Future<RegisterResponse> register(RegisterBody body) async {
    print("Body is ${body.toJson()}");
    final map = await postMethod(URL.createUser, body: body.toJson());
    return RegisterResponse.fromJsonMap(map);
  }
}