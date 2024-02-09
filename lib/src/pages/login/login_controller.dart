import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../providers/users_provider.dart';
import '../../utilities/my_snackbar.dart';
import '../../utilities/shared_pref.dart';

class LoginController {

  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future? init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});
    if (kDebugMode) {
      print ('user ${user.toJson()}');
    }
    if (user.sessionToken != null) {
      if (user.sessionToken!.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context!, 'client/products/list', (route) => false);
      }
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi;
    responseApi = (await usersProvider.login(email, password))!;
    if (responseApi.success != null) {
      if (responseApi.success!) {
        User user = User.fromJson(responseApi.data);
        _sharedPref.save('user', user.toJson());

        print('[INFO] Usuario logueado: ${user.toJson()}');
        if (user.roles != null) {
          if (user.roles!.length > 1) {
            Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(context!, user.roles![0].route, (route) => false);
          }
        }

        Navigator.pushNamedAndRemoveUntil(context!, 'client/products/list', (route) => false);
      }
    } else {
      if (responseApi.message != null) {
        MySnackbar.show(context!, responseApi.message!);
      }
    }

    if (kDebugMode) {
      print('Respuesta object: ${responseApi}');
      print('Respuesta: ${responseApi.toJson()}');

      print('Email: $email');
      print('Password: $password');
    }
  }
}