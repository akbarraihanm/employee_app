import 'package:flutter/material.dart';

class AppUtil {
  static bindingInstance(Function function) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      function.call();
    });
  }
}