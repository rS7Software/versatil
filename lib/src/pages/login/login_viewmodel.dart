import 'package:flutter/material.dart';

import '../../utilities/validation_item.dart';
import 'login_state.dart';

class LoginViewModel extends ChangeNotifier {
  LoginState _state = LoginState();

  LoginState get state => _state;

  LoginViewModel();

  void changeUsername(String value) {
    if (value.length >= 4) {
      _state = _state.copyWith(username: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(username: ValidationItem(error:'3 caracteres min.'));
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 4) {
      _state = _state.copyWith(password: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(password: ValidationItem(error:'4 caracteres min.'));
    }

    notifyListeners();
  }

  void processing(String username, String password, String accion) {
    _state = _state.copyWith(
        username: ValidationItem(value: password),
        password: ValidationItem(value: password),
        accion: accion
    );
  }
}