import 'package:flutter/material.dart';

class PasswordVisibilityToggle {
  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
  }

  Icon getVisibilityIcon() {
    return isPasswordHidden
        ? const Icon(
            Icons.visibility_off,
            color: Color.fromRGBO(217, 217, 217, 1),
          )
        : const Icon(
            Icons.visibility,
            color: Colors.black,
          );
  }
}
