import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginController {

  BuildContext? context;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (kDebugMode) {
      print('username: $username');
      print('PASSWORD: $password');
    }
  }
}