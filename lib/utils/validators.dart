import 'package:flutter/material.dart';

bool validateEmail(TextEditingController controller) {
  if (controller.text.isNotEmpty) {
    if (controller.text.contains('@')) {
      if (controller.text.contains('.com')) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}


String? errorPassword(String passwordText, String? repeatPassText) {
  if (passwordText == '') {
    return "Introduzca una contraseña";
  } else {
    if ((repeatPassText != passwordText) && (repeatPassText != null)) {
      return "Las contraseñas no coinciden";
    }
  }
  return null;
}
