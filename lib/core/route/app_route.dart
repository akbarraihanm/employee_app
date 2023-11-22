import 'package:employee_app/di/app_locator.dart';
import 'package:employee_app/presentation/register/bloc/register_bloc.dart';
import 'package:employee_app/presentation/register/page/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routeNames(BuildContext context) {
    return {
      RegisterScreen.routeName: (context) => BlocProvider<RegisterBloc>(
        create: (_) => RegisterBloc(sl()),
        child: const RegisterScreen(),
      ),
    };
  }
}