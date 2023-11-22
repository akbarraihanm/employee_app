import 'package:flutter/material.dart';

abstract class RegisterState {
  void when({
    Function? onLoading,
    Function(String message)? onSuccess,
    Function(String message)? onError,
  }) {
    final state = this;
    if (state is ShowLoadingRegister) {
      onLoading?.call();
    } else if (state is SuccessRegister) {
      onSuccess?.call(state.message);
    } else if (state is ShowErrorRegister) {
      onError?.call(state.message);
    }
  }

  Widget buildWhen({
    required Widget onInit,
    Widget? onLoading,
  }) {
    final state = this;
    if (state is ShowLoadingRegister) {
      return onLoading ?? onInit;
    }

    return onInit;
  }
}

class InitRegister extends RegisterState {}

class ShowLoadingRegister extends RegisterState {}

class SuccessRegister extends RegisterState {
  String message;

  SuccessRegister(this.message);
}

class ShowErrorRegister extends RegisterState {
  String message;

  ShowErrorRegister(this.message);
}
