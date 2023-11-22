import 'package:employee_app/core/config/app_env.dart';
import 'package:employee_app/core/config/app_typography.dart';
import 'package:employee_app/core/widgets/button/app_button.dart';
import 'package:employee_app/core/widgets/forms/app_form_field.dart';
import 'package:employee_app/core/widgets/forms/column_form_widget.dart';
import 'package:employee_app/core/widgets/forms/password_form_field.dart';
import 'package:employee_app/domain/register/data/models/body/register_body.dart';
import 'package:employee_app/presentation/register/bloc/register_bloc.dart';
import 'package:employee_app/presentation/register/bloc/register_event.dart';
import 'package:employee_app/presentation/register/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppEnv.isDev? Colors.deepPurpleAccent: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnFormWidget(
                        title: "Staff ID",
                        item: AppFormField(
                          hint: "Input Staff ID",
                          bgColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4,
                          ),
                          inputType: TextInputType.number,
                          onChanged: (v) {
                            context.read<RegisterBloc>().body.staffId = v;
                            if (v.isEmpty) {
                              context.read<RegisterBloc>().body.staffId = null;
                            }
                            context.read<RegisterBloc>().add(DoValidate());
                          },
                        ),
                      ),
                      ColumnFormWidget(
                        title: "Staff Name",
                        item: AppFormField(
                          hint: "Input Staff Name",
                          bgColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4,
                          ),
                          inputType: TextInputType.name,
                          onChanged: (v) {
                            context.read<RegisterBloc>().body.name = v;
                            if (v.isEmpty) {
                              context.read<RegisterBloc>().body.name = null;
                            }
                            context.read<RegisterBloc>().add(DoValidate());
                          },
                        ),
                      ),
                      ColumnFormWidget(
                        title: "Hobby",
                        item: AppFormField(
                          hint: "Input Hobby",
                          bgColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4,
                          ),
                          onChanged: (v) {
                            context.read<RegisterBloc>().body.hobby = v;
                            if (v.isEmpty) {
                              context.read<RegisterBloc>().body.hobby = null;
                            }
                            context.read<RegisterBloc>().add(DoValidate());
                          },
                        ),
                      ),
                      ColumnFormWidget(
                        title: "Password",
                        item: PasswordFormField(
                          hint: "Input Password",
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4,
                          ),
                          obscure: context.read<RegisterBloc>().isPasswordHidden,
                          onChanged: (v) {
                            context.read<RegisterBloc>().body.password = v;
                            if (v.isEmpty) {
                              context.read<RegisterBloc>().body.password = null;
                            }
                            context.read<RegisterBloc>().add(DoValidate());
                          },
                          onTapPassword: () {
                            context.read<RegisterBloc>().add(
                              VisibleRegisterPassword(),
                            );
                          },
                        ),
                      ),
                      ColumnFormWidget(
                        title: "Confirm Password",
                        item: PasswordFormField(
                          hint: "Input Confirm Password",
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4,
                          ),
                          obscure: context.read<RegisterBloc>().isPasswordHidden,
                          onChanged: (v) {
                            context.read<RegisterBloc>().body.confirmPassword = v;
                            if (v.isEmpty) {
                              context.read<RegisterBloc>().body.confirmPassword = null;
                            }
                            context.read<RegisterBloc>().add(DoValidate());
                          },
                          onTapPassword: () {
                            context.read<RegisterBloc>().add(
                              VisibleRegisterPassword(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              state.when(
                onError: (message) => Fluttertoast.showToast(
                  msg: message,
                  backgroundColor: Colors.red,
                ),
                onSuccess: (message) {
                  context.read<RegisterBloc>().body = RegisterBody();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                     message,
                     style: AppTypography.copyWith(color: Colors.white),
                    ),
                  ));
                }
              );
            },
            builder: (context, state) {
              return state.buildWhen(
                onInit: AppButton(
                  title: "Register",
                  color: Colors.green,
                  margin: const EdgeInsets.all(16),
                  textStyle: AppTypography.copyWith(
                    color: Colors.white,
                    weight: FontWeight.w600,
                  ),
                  isEnable: context.read<RegisterBloc>().isValid,
                  onPressed: () {
                    context.read<RegisterBloc>().add(DoRegister());
                  },
                ),
                onLoading: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
