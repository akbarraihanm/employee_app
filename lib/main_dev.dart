import 'package:employee_app/core/config/app_env.dart';
import 'package:employee_app/core/route/app_route.dart';
import 'package:employee_app/di/app_locator.dart';
import 'package:employee_app/presentation/register/page/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  AppEnv(Environment.dev);
  AppLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: AppRoute.routeNames(context),
        initialRoute: RegisterScreen.routeName,
      ),
    );
  }
}
