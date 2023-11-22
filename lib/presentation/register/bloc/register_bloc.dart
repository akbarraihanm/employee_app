import 'package:bloc/bloc.dart';
import 'package:employee_app/domain/register/data/models/body/register_body.dart';
import 'package:employee_app/domain/register/domain/use_case/do_register_use_case.dart';
import 'package:employee_app/presentation/register/bloc/register_event.dart';
import 'package:employee_app/presentation/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final DoRegisterUseCase doRegisterUseCase;

  bool isValid = false;
  bool isPasswordHidden = true;
  RegisterBody body = RegisterBody();

  RegisterBloc(this.doRegisterUseCase): super(InitRegister()) {
    on<DoValidate>((event, emit) {
      if (body.staffId != null && body.name != null && body.password != null
          && body.confirmPassword != null) {
        if (body.password == body.confirmPassword) {
          isValid = true;
        } else {
          isValid = false;
        }
      }
      emit(InitRegister());
    });

    on<VisibleRegisterPassword>((event, emit) {
      if (isPasswordHidden) {
        isPasswordHidden = false;
      } else {
        isPasswordHidden = true;
      }

      add(DoValidate());
    });

    on<DoRegister>((event, emit) async {
      emit(ShowLoadingRegister());

      final result = await doRegisterUseCase(body);
      if (result.message != null) {
        emit(ShowErrorRegister(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowErrorRegister(result.networkError ?? ""));
      } else {
        final data = result.data;
        emit(SuccessRegister("Employee successfully registered: ${data?.name}"));
      }
    });
  }

}